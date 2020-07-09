<?php

namespace auth_server_sso;

class LoginButton extends \Component {

    public $red_uri = 'https://integrator.com/as-verify';
    public $scopes = 'email';

    public function render() {
        global $config;

        $state = bin2hex(random_bytes(10));
        $_SESSION['as_state'] = $state;

        $login_uri = sprintf(
            "https://auth-server.com/oauth2/auth?response_type=code&client_id=%s&scope=%s&redirect_uri=%s&state=%s",
            $config['client_id'], $this->scopes, urlencode($this->red_uri), $state
        );

        return sprintf(
            '<a class="btn btn-secondary btn-block" href="%s">'.
            '<span class="fa fa-server pr-2"></span>'.
            'Log in with AS!</a>', $login_uri);
    }
}
