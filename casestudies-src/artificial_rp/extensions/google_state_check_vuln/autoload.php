<?php

namespace google_sso {

    class FlawedGCallback extends GCallback {
        public function callback($service) {
            $_SESSION['google_state']=$_GET['state'];
            return GCallback::callback($service);
        }
    }

}

namespace {
    ExtensionsManager::instance()->registerExtension([
        'name' => 'google_sso_state_check_vuln',
        'tags' => ['google-state-check-vuln'],
        'depends_on' => ['google-login']
    ], function () {
        ComponentsManager
        ::instance()
        ->registerComponent('routes', 'gcallback', new google_sso\FlawedGCallback());
    });
}
