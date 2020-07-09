<?php

namespace google_sso;

class GCallback extends \Component {

    public $callback_path = '/google-verify';
    public $red_uri = 'https://integrator.com/google-verify';


    public function render() {
        global $klein;
        $klein->respond(array('GET','POST'), $this->callback_path, function ($req,$res,$service) {
            return $this->callback($service);
        });
    }

    public function callback($service){
        global $google_config;
        global $g_client;

        if (!isset($_GET['code']) || !isset($_GET['state']))
            die("Error: bad request.");

        if ($_GET['state'] !== $_SESSION['google_state'])
            die("Error: state matching error.");

        $code = $_GET['code'];

        $g_client->setRedirectUri($this->red_uri);
        $g_client->authenticate($code);
        $access_token = $g_client->getAccessToken();

        if (!isset($access_token)){
            var_dump($access_token);
            var_dump($g_client);
            die('Error: invalid response.');
        }

        $_SESSION['google_access_token'] = $access_token;
        $service->render(__DIR__.'/template_success.php', ['access_token' => $access_token['access_token']]);
    }
}
