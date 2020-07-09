<?php

namespace facebook_sso;

$fb_config = [
    'app_id' => '390639234906615',
    'app_secret' => 'b0b2f4c7196624ec617cdd022c044de5',
    'default_graph_version' => 'v3.2',
];
//Set custom proxied HTTP Client
if (getenv('HTTP_PROXY') && getenv('HTTP_PROXY_PORT')) {
    $proxied_client = new \GuzzleHttp\Client([
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
    $fb_config['http_client_handler'] = $proxied_client;
}
$fb = new \Facebook\Facebook($fb_config);
