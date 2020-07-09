<?php

namespace auth_server_sso;

function http($url, $params=false, $token=false) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    // proxy?
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    
    if($params)
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));

    $headers = [
        'Accept: application/json',
        'User-Agent: curl', # Apple requires a user agent header at the token endpoint
    ];
    if ($token){
        $headers[] = "Authorization: Bearer $token";
    }
    
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    $response = curl_exec($ch);
    return json_decode($response);
}

class Callback extends \Component {

    public $callback_path = '/as-verify';
    public $red_uri = 'https://integrator.com/as-verify';


    public function render() {
        global $klein;
        $klein->respond(array('GET','POST'), $this->callback_path, function ($req,$res,$service) {
            return $this->callback($service);
        });
    }

    public function callback($service){
        global $config;
        global $users;

        if (!isset($_GET['code']) || !isset($_GET['state']))
            die("Error: bad request.");

        if ($_GET['state'] !== $_SESSION['as_state'])
            die("Error: state matching error.");

        $code = $_GET['code'];

        $token_uri = sprintf(
            "https://auth-server.com/oauth2/token?client_id=%s&redirect_uri=%s&client_secret=%s&code=%s",
            $config['client_id'], urlencode($this->red_uri), $config['secret_key'], $code
        );
        
        $response = http($token_uri);
        if (!isset($response->token))
            die("Error getting access token!");

        $email=http('https://auth-server.com/info', false, $response->token);


        $document = array('username' => (string) $email->email);
        if ($users->count($document) == 1)
            login_with_access_token($email->email, $response->token, $email->email, "as");
        else {
            register_with_access_token($email->email, $response->token, $email->email, "as");
            login_with_access_token($email->email, $response->token, $email->email, "as");
        }



        $_SESSION['as_access_token'] = $response->token;
        $service->render(__DIR__.'/template_success.php', ['access_token' => $response->token, 'email' => $email->email]);
    }
}
