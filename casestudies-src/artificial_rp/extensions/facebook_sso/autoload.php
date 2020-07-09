<?php

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/login_button.php';
require_once __DIR__ . '/settings_button.php';
require_once __DIR__ . '/callback.php';

ExtensionsManager::instance()->registerExtension([
    'name'       => 'facebook_sso',
    'tags'       => ['fb-login', 'fb-association'],
    'depends_on' => [],
], function () {
    // register or modify components
    ComponentsManager::instance()->registerComponent(
        'routes', 'fbcallback', new facebook_sso\FBCallback());
    ComponentsManager::instance()->registerComponent(
        'login-button', 'fbbutton', new facebook_sso\FBLoginButton());
    ComponentsManager::instance()->registerComponent(
        'settings-button', 'fbbutton', new facebook_sso\FBSettingsButton());
});
