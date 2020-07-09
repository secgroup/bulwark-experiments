<?php

namespace vk_sso;

$vk_config = [
    'client_id' => '7054259',
    'secret_key' => '2K3HEOyYN68Qy6wSZasW'
];


$vk_oauth = new \VK\OAuth\VKOAuth();

// Set custom proxy options using reflection
if (getenv('HTTP_PROXY') && getenv('HTTP_PROXY_PORT')) {
    $hc_ref = new \ReflectionProperty("\VK\OAuth\VKOauth", "http_client");
    $hc_ref->setAccessible(true);
    $curl = $hc_ref->getValue($vk_oauth);
    $io_ref = new \ReflectionProperty("\VK\TransportClient\Curl\CurlHttpClient", "initial_opts");
    $io_ref->setAccessible(true);
    $opts = $io_ref->getValue($curl);

    $opts[CURLOPT_SSL_VERIFYHOST] = 0;
    $opts[CURLOPT_SSL_VERIFYPEER] = 0;
    $opts[CURLOPT_PROXY] = getenv('HTTP_PROXY');
    $opts[CURLOPT_PROXYPORT] = getenv('HTTP_PROXY_PORT');

    $io_ref->setValue($curl, $opts);
}
