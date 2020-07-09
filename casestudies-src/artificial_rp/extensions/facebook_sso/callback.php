<?php

namespace facebook_sso;
require_once __DIR__.'/../../includes/utils.inc.php';

class FBCallback extends \Component {

    public $callback_path = '/fb-callback';
    public $red_uri = 'https://integrator.com/fb-callback';

    public function render() {
        global $klein;
        $klein->respond(array('GET','POST'), $this->callback_path, function ($req,$res, $service) {
            return $this->fb_callback($service);
        });
    }

    public function fb_callback($service) {
        list($accessToken, $facebook_id, $email) = $this->getAccessToken();
				//TODO: if email is already present in db log that user, otherwise create a new user and associate the FB account


        $msg = $this->associateAccount($accessToken, $facebook_id, $email);
        $service->render(__DIR__.'/template_success.php', ['access_token' => $accessToken, 'msg' => $msg]);
    }

    function getAccessToken() {
        global $fb;
        global $fb_config;
        $helper = $fb->getRedirectLoginHelper();

        try {
            $accessToken = $helper->getAccessToken($this->red_uri);
        } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            return;
        } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            return;
        }

        if (! isset($accessToken)) {
            if ($helper->getError()) {
                header('HTTP/1.0 401 Unauthorized');
                header('Content-type: text/plain');

                echo "Error: " . $helper->getError() . "\n";
                echo "Error Code: " . $helper->getErrorCode() . "\n";
                echo "Error Reason: " . $helper->getErrorReason() . "\n";
                echo "Error Description: " . $helper->getErrorDescription() . "\n";
            } else {
                header('HTTP/1.0 400 Bad Request');
                echo 'Bad request';
            }
            return;
        }


        // Logged in
        //echo '<h3>Access Token</h3>';
        //var_dump($accessToken->getValue());

        // The OAuth 2.0 client handler helps us manage access tokens
        $oAuth2Client = $fb->getOAuth2Client();

        // Get the access token metadata from /debug_token
        $tokenMetadata = $oAuth2Client->debugToken($accessToken);
        //echo '<h3>Metadata</h3>';
        //var_dump($tokenMetadata);

        // Validation (these will throw FacebookSDKException's when they fail)
        $tokenMetadata->validateAppId($fb_config['app_id']);
        // If you know the user ID this access token belongs to, you can validate it here
        //$tokenMetadata->validateUserId('123');
        $tokenMetadata->validateExpiration();

        if (! $accessToken->isLongLived()) {
            // Exchanges a short-lived access token for a long-lived one
            try {
                $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
            } catch (\Facebook\Exceptions\FacebookSDKException $e) {
                echo "<p>Error getting long-lived access token: " . $e->getMessage() . "</p>\n\n";
                return;
            }

            echo '<h3>Long-lived</h3>';
            var_dump($accessToken->getValue());
        }
        $fb->setDefaultAccessToken($accessToken);

        // Get the email
        $response = $fb->get('/me?locale=en_US&fields=name,email');
        $userNode = $response->getGraphUser();
        $email = $userNode->getField('email');

        // Get facebook user id
        $facebook_id = $tokenMetadata->getProperty('user_id');

        return array($accessToken, $facebook_id, $email);
    }

    function associateAccount($accessToken, $facebook_id, $email) {
        global $users;
        
        $document = array('username' => (string) $email);

        // TODO: add management if register or login functions return false
        if ($users->count($document) == 1){
            login_with_access_token($email, $accessToken, $facebook_id, "fb");
            $msg = 'You have been successfully logged in';
        } else {
            if (register_with_access_token($email, $accessToken, $facebook_id, "fb")) {
                $msg = 'You have been successfully registered';
            } else {
                echo "error registering user";
            }
        }
        // $_SESSION['fb_access_token'] = (string) $accessToken;

        return $msg;
    }
}
