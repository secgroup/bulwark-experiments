<?php

namespace google_sso;

$google_config = [
];


$g_client = new \Google_Client();
$g_client->setAuthConfig(__DIR__.'/client_secret.json');

if (getenv('HTTP_PROXY') && getenv('HTTP_PROXY_PORT')) {
    $httpClient = new \GuzzleHttp\Client([
        'defaults' => [
            'config' => [
                'curl' => [
                    CURLOPT_SSL_VERIFYHOST => 0,
                    CURLOPT_SSL_VERIFYPEER => 0,
                    CURLOPT_PROXY => getenv('HTTP_PROXY'),
                    CURLOPT_PROXYPORT => getenv('HTTP_PROXY_PORT'),
                ]
            ]
        ]
    ]);
    $g_client->setHttpClient($httpClient);
}
