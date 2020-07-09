<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/includes/utils.inc.php';
require_once __DIR__ . '/includes/extensions.inc.php';

////////////////////////////////////////////////////////////////////////////////
// GLOBALS/CONFIG

// start session on each page
session_start();
$mongoclient = new MongoDB\Client('mongodb://mongo-app');
$users = $mongoclient->sso->users;
$klein = new \Klein\Klein();


////////////////////////////////////////////////////////////////////////////////
// EXTENSIONS

// Require init files from extensions directory
$exts = glob(__DIR__ . '/extensions/*/autoload.php');
foreach($exts as $ext) {
    require($ext);
}
ExtensionsManager::instance()->installExtensions();


////////////////////////////////////////////////////////////////////////////////
// APP

// Set the layout on all routes
$klein->respond(array('GET','POST'), '*', function ($req, $res, $service) {
    $service->layout(__DIR__.'/templates/layout.php');
});

$klein->respond(array('GET','POST'), '/login', function ($req, $res, $service) {
    if ($req->method('post')) {
	if(login_with_password($req->params()["username"], $req->params()["password"])){
	    // Login successful
	    $buttons = ComponentsManager::instance()->renderComponents('settings-button');
	    $service->render(__DIR__.'/templates/settings.php', ['buttons' => $buttons]);
	    header("Location: /settings");
	    return;
	} else {
            
	}
    }

    $buttons = ComponentsManager::instance()->renderComponents('login-button');
    $service->render(__DIR__.'/templates/login.php', ['buttons' => $buttons]);
});

$klein->respond(array('GET','POST'), '/settings', function ($req, $res, $service) {
    $buttons = ComponentsManager::instance()->renderComponents('settings-button');
    $service->render(__DIR__.'/templates/settings.php', ['buttons' => $buttons]);
});

$klein->respond('GET', '/logout', function ($req, $res, $service) {
    session_destroy();
    header("Location: /");
    return;
});

$klein->respond(array('GET','POST'), '/register', function ($req, $res, $service) {
    if ($req->method('post')) {
	if(register_with_password($req->params()["username"], $req->params()["password"])){
	    $service->render(__DIR__.'/templates/login.php');
	} else {
	    $service->render(__DIR__.'/templates/register.php');
	}
    } else {
        $service->render(__DIR__.'/templates/register.php');
    }
});


$klein->respond('GET', '/', function ($req, $res, $service) {
    $service->render(__DIR__.'/templates/home.php');
});

$klein->onHttpError(function ($code, $router) {
    echo 'Error '.$code;
});

// Render all registered components that add routes to the app
ComponentsManager::instance()->renderComponents('routes');

$klein->dispatch();
