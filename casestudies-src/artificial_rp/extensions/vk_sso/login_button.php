<?php

namespace vk_sso;

class VKLoginButton extends \Component {

    public $red_uri = 'https://integrator.com/vk-verify';
    public $scopes = array(\VK\OAuth\Scopes\VKOAuthUserScope::EMAIL);

    public function render() {
        global $vk_config;
        global $vk_oauth;

        $state = bin2hex(random_bytes(10));
        $_SESSION['vk_state'] = $state;

        $login_uri = $vk_oauth->getAuthorizeUrl(
            \VK\OAuth\VKOAuthResponseType::CODE,
            $vk_config['client_id'], $this->red_uri,
            \VK\OAuth\VKOAuthDisplay::PAGE, $this->scopes, $state);

        return sprintf(
            '<a class="btn btn-info btn-block" href="%s">'.
            '<span class="fa fa-vk pr-2"></span>'.
            'Log in with VK!</a>', $login_uri);
    }
}
