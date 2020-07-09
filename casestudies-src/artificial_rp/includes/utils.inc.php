<?php

function array_flatmap() {
    $args = func_get_args();
    $mapped = array_map(function ($a) {
        return (array)$a;
    }, call_user_func_array('array_map', $args));

    return count($mapped) === 0 ? array() : call_user_func_array('array_merge', $mapped);
}

function login_with_access_token($user, $accessToken, $idpId, $idpName) {
    global $users;

    $users->updateOne(
        array("username" => $user),
        array('$set' => array('fb_user_id' => $idpId, "fb_access_token" => $accessToken)),
    );

    $document = array($idpName.'_user_id' => (string) $idpId);
    $cursor = $users->find($document);
    $it = new \IteratorIterator($cursor);
    $it->rewind();
    while($user = $it->current()){
        $_SESSION["username"] = $user['username'];
        // User is logged in
        $_SESSION["loggedin"] = true;
        // User is logged in into IdP
        $_SESSION[$idpName."_loggedin"] = true;
        $_SESSION[$idpName."_user_id"] = $idpId;
        $_SESSION[$idpName."_access_token"] = $accessToken;
        return true;
    }
    return false;
}

function register_with_access_token($user, $accessToken, $idpId, $idpName) {
    global $users;

    $document = array('username' => (string) $user);
    if ($users->count($document) > 0){
        return false;
    }
    //$document['password'] = (string) sha1($password);
    $document[$idpName.'_access_token'] = (string) $accessToken;
    $document[$idpName.'_user_id'] = (string) $idpId;
    $users->insertOne($document);
    return true;
}

function login_with_password($user, $password) {
    global $users;
    $document = array('username' => (string) $user);
    $cursor = $users->find($document);
    $it = new \IteratorIterator($cursor);
    $it->rewind();
    while($user = $it->current()){
				if((string) sha1($password) == $user['password']) {
					$_SESSION["username"] = $user['username'];
					// User is logged in
					$_SESSION["loggedin"] = true;
					return true;
				}
    }
    return false;
}

function register_with_password($user, $password) {
    global $users;

    $document = array('username' => (string) $user);
    if ($users->count($document) > 0){
        return false;
    }
    $document['password'] = (string) sha1($password);
    $users->insertOne($document);
    return true;
}
