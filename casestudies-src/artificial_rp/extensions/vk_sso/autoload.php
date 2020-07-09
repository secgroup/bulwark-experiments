<?php

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/login_button.php';
require_once __DIR__ . '/callback.php';


ExtensionsManager::instance()->registerExtension([
    'name'       => 'vk_sso',
    'tags'       => ['vk-login'],
    'depends_on' => [],
], function () {
    // register or modify components
    ComponentsManager::instance()->registerComponent(
        'routes', 'vkcallback', new vk_sso\VKCallback());
    ComponentsManager::instance()->registerComponent(
        'login-button', 'vkbutton', new vk_sso\VKLoginButton());
});

