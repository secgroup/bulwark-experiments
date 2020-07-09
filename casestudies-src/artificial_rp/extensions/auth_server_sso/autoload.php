<?php

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/login_button.php';
require_once __DIR__ . '/callback.php';


ExtensionsManager::instance()->registerExtension([
    'name'       => 'auth_server_sso',
    'tags'       => ['as-login'],
    'depends_on' => [],
], function () {
    // register or modify components
    ComponentsManager::instance()->registerComponent(
        'routes', 'ascallback', new auth_server_sso\Callback());
    ComponentsManager::instance()->registerComponent(
        'login-button', 'asbutton', new auth_server_sso\LoginButton());
});

