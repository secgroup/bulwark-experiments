<?php



require_once __DIR__ . '/config.php';
require_once __DIR__ . '/login_button.php';
require_once __DIR__ . '/callback.php';


ExtensionsManager::instance()->registerExtension([
    'name'       => 'google_sso',
    'tags'       => ['google-login'],
    'depends_on' => [],
], function () {
    // register or modify components
    ComponentsManager::instance()->registerComponent(
        'routes', 'gcallback', new google_sso\GCallback());
    ComponentsManager::instance()->registerComponent(
        'login-button', 'gbutton', new google_sso\GLoginButton());
});


