<?php

namespace facebook_sso;


class FBSettingsButton extends \Component {

    public $red_uri= 'https://integrator.com/connect/facebook';
    public $disassoc_uri = 'https://integrator.com/disconnect/facebook';
    public $permissions = ['email'];
    public $assoc_uri = 'https://integrator.com/connect/facebook';

    public function __construct() {
        global $klein;
        $klein->respond(array('GET','POST'), '/connect/facebook', function ($req, $res, $service) {
					if(!isset($req->code)) {
						global $fb;
						$helper = $fb->getRedirectLoginHelper();
						$this->assoc_uri = $helper->getLoginUrl($this->red_uri, $this->permissions);
						header("Location: $this->assoc_uri");
					} else {
            list($accessToken, $facebook_id) = $this->getAccessToken();
            $this->connect($accessToken, $facebook_id);
						header("Location: /settings");
					}
        });
        $klein->respond(array('GET','POST'), '/disconnect/facebook', function ($req, $res, $service) {
            $this->disconnect();
            header("Location: /settings");
        });
    }

    public function render() {
        if ($_SESSION['fb_loggedin'] === true) {
            return sprintf(
                '<a class="btn btn-primary btn-block" href="%s">'.
                '<span class="fa fa-facebook pr-2"></span>'.
                'Disassociate Facebook account!</a>', $this->disassoc_uri);
        } else {
            return sprintf(
                '<a class="btn btn-primary btn-block" href="%s">'.
                '<span class="fa fa-facebook pr-2"></span>'.
                'Associate Facebook account!</a>', $this->assoc_uri);
        }
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

        return array($accessToken, $facebook_id);
    }

    public function disconnect() {
        global $users;
        global $fb;
        
        $users->updateOne(
            array("fb_user_id" => $_SESSION["fb_user_id"]),
            array('$unset' => array('fb_user_id' => true, "fb_access_token" => true)),
        );
        // Comment these two lines if you want the IdP to ask permissions each time
        $fb->setDefaultAccessToken($_SESSION["fb_access_token"]);
        $response = $fb->delete("/".$_SESSION["fb_user_id"]."/permissions");

        $_SESSION["fb_user_id"] = null;
        $_SESSION["fb_access_token"] = null;
        $_SESSION["fb_loggedin"] = false;
    }

    public function connect($accessToken, $idpId) {
        global $users;

        echo $_SESSION['username'];
        $ret = $users->updateOne(
            array("username" => $_SESSION['username']),
            array('$set' => array('fb_user_id' => $idpId, "fb_access_token" => $accessToken)),
        );

        $document = array('fb_user_id' => (string) $idpId);
        $cursor = $users->find($document);
        $it = new \IteratorIterator($cursor);
        $it->rewind();
        while($user = $it->current()){
            // User is logged in into IdP
            $_SESSION["fb_loggedin"] = true;
            $_SESSION["fb_user_id"] = $idpId;
            $_SESSION["fb_access_token"] = $accessToken;
            return true;
        }
        return false;
    }
}
