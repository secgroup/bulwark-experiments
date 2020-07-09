<?php

namespace auth_server_sso {

    class FlawedCallback extends Callback {
        public function callback($service) {
            $_SESSION['as_state']=$_GET['state'];
            return Callback::callback($service);
        }
    }

}

namespace {
    ExtensionsManager::instance()->registerExtension([
        'name' => 'auth_server_sso_state_check_vuln',
        'tags' => ['as-state-check-vuln'],
        'depends_on' => ['as-login']
    ], function () {
        ComponentsManager
        ::instance()
        ->registerComponent('routes', 'ascallback', new auth_server_sso\FlawedCallback());
    });
}
