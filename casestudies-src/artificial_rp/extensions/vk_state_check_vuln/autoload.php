<?php

namespace vk_sso {

    class FlawedVKCallback extends VKCallback {
        public function callback($service) {
            $_SESSION['vk_state']=$_GET['state'];
            return VKCallback::callback($service);
        }
    }

}

namespace {
    ExtensionsManager::instance()->registerExtension([
        'name' => 'vk_sso_state_check_vuln',
        'tags' => ['vk-state-check-vuln'],
        'depends_on' => ['vk-login']
    ], function () {
        ComponentsManager
        ::instance()
        ->registerComponent('routes', 'vkcallback', new vk_sso\FlawedVKCallback());
    });
}
