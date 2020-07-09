<?php

namespace facebook_sso;


class FBLoginButton extends \Component {

    public $red_uri = 'https://integrator.com/fb-callback';
    public $permissions = ['email'];
    public $login_uri = null;

    public function __construct() {
        global $fb;
        $helper = $fb->getRedirectLoginHelper();
        $this->login_uri = $helper->getLoginUrl($this->red_uri, $this->permissions);
    }

    public function render() {
        return sprintf(
            '<a class="btn btn-primary btn-block" href="%s">'.
            '<span class="fa fa-facebook pr-2"></span>'.
            'Log in with Facebook!</a>', $this->login_uri);
    }
}
