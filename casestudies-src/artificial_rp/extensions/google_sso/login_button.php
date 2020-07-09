<?php

namespace google_sso;

class GLoginButton extends \Component {

    public $red_uri = 'https://integrator.com/google-verify';

    public function render() {
        global $google_config;
        global $g_client;

        $state = bin2hex(random_bytes(10));
        $_SESSION['google_state'] = $state;

        $g_client->addScope(\Google_Service_Drive::DRIVE_METADATA_READONLY);
        $g_client->setRedirectUri($this->red_uri);
        $g_client->setAccessType('offline');
        $g_client->setState($state);
        
        $login_uri = $g_client->createAuthUrl();

        return sprintf(
            '<a class="btn btn-warning btn-block" href="%s">'.
            '<span class="fa fa-google pr-2"></span>'.
            'Log in with Google!</a>', $login_uri);
    }
}
