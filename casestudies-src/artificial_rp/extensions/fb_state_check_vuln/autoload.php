<?php

namespace facebook_sso {

    class FlawedFBCallback extends FBCallback {
        public function fb_callback($service) {
            // https://stackoverflow.com/questions/32029116/facebook-sdk-returned-an-error-cross-site-request-forgery-validation-failed-th
            $_SESSION['FBRLH_state']=$_GET['state'];
            return FBCallback::fb_callback($service);
        }
    }

}

namespace {
    ExtensionsManager::instance()->registerExtension([
        'name' => 'facebook_sso_state_check_vuln',
        'tags' => ['fb-state-check-vuln'],
        'depends_on' => ['fb-login']
    ], function () {
        ComponentsManager
        ::instance()
        ->registerComponent('routes', 'fbcallback', new facebook_sso\FlawedFBCallback());
    });
}
