<?php

namespace vk_sso;

class VKCallback extends \Component {

    public $callback_path = '/vk-verify';
    public $red_uri = 'https://integrator.com/vk-verify';


    public function render() {
        global $klein;
        $klein->respond(array('GET','POST'), $this->callback_path, function ($req,$res,$service) {
            return $this->callback($service);
        });
    }

    public function callback($service){
        global $vk_config;
        global $vk_oauth;

        if (!isset($_GET['code']) || !isset($_GET['state']))
            die("Error: bad request.");

        if ($_GET['state'] !== $_SESSION['vk_state'])
            die("Error: state matching error.");

        $code = $_GET['code'];
        $resp = $vk_oauth->getAccessToken(
            $vk_config['client_id'], $vk_config['secret_key'], $this->red_uri, $code);
        if (!isset($resp['access_token'])){
            var_dump($resp);
            die('Error: invalid response.');
        }

        $_SESSION['vk_access_token'] = $resp['access_token'];
        $service->render(__DIR__.'/template_success.php', ['access_token' => $resp['access_token']]);
    }
}
