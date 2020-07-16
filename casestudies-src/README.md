# Case studies

## OAuth 2.0

### Set-Up

#### Obtaining OAuth Credentials

- Auth Server: the artificial RP is already configured with the artificial IdP (AS) integration
- Google: [guide](https://developers.google.com/identity/protocols/oauth2/web-server#creatingcred)
- Facebook: [guide](https://developers.facebook.com/docs/facebook-login/web#redirecturl)
- VK: [documentation](https://vk.com/dev/authcode_flow_user)

#### Running the Artificial RP

```sh
docker-compose -f docker-compose.oauth.yml up --build
```
A proxy server is listening on port `8080`. 
This proxy is the only way to connect to the case study virtual network: 
the artificial RP is reachable through the proxy at `https://integrator.com`.  
A CA needs to be installed on the browser for the proxy to work correctly: you can download the certificate by visiting (through the proxy) the http://mitm.it website and installing it in the browser settings.

The `docker-compose` command sets up a testing environment composed of four proxies:
- a **reverse proxy** in front of the artificial RP. Web interface on port `8082`.
- a **proxy** between the artificial RP and the IdPs (back channels). Web interface on port `8083`.
- a **reverse proxy** in front of the artificial IdP. Web interface on port `8084`.
- a **proxy** through which the virtual network is accessible (listening on port `8080`). Web interface on port `8081`.

The artificial IdP "AS" is already configured and can be tested with the following user account:
- `alberto.lupo@null.net:qwerty` (username:password)


### Attacker controlled website

The `http://attacker.com` website is accessible through the proxy on port `8080`.
This malicious website integrates the AS IdP using the honest `client_id` and a malicious `redirect_uri` and can be used to mount the *Unauthorized login by auth. code redirection* attack. In particular, the attack is executed as follows
1. The victim is tricked into clicking on the "Log in with AS" button at `attacker.com`.
2. The victim is redirected to the `/get-code.php` page, that saves the victim auth. code and show an error.
3. The attacker can replay the obtained code (in `attacker.com/log.txt`) to the artificial RP to log in as the victim:
   1. The attacker visits `https://integrator.com/login`, clicks on "Log in with AS" and obtains a valid `state` parameters by extracting it from the auth-server.com URL `https://auth-server.com/oauth2/auth?response_type=code&client_id=67538654696&scope=email&redirect_uri=https%3A%2F%2Fintegrator.com%2Fas-verify&state=<STATE>`.
   2. The attacker visits the callback page of integrator.com `https://integrator.com/as-verify?code=<CODE>&state=<STATE>` where,
      - `<STATE>`: is the `state` parameter obtained at step 3.1
      - `<CODE>`: is the victim auth. code that is stored in `attacker.com/log.txt`.
   3. The attacker is now logged into integrator.com as the victim.

### Monitors

1. The service worker monitor on the artificial RP is enabled by default and can be disabled by removing the `sw_monitor` folder in `/casestudies-src/artificial_rp/estensions/`. The monitor is currently configured for the AS (artificial IdP) integration: the configuration can be changed by editing the [sw.js](https://github.com/secgroup/bulwark-experiments/blob/master/casestudies-src/artificial_rp/extensions/sw_monitor/sw.js#L2) file.
2. The proxy monitor on the artificial IdP can be enabled by decommenting [line 47](https://github.com/secgroup/bulwark-experiments/blob/master/casestudies-src/docker-compose.oauth.yml#L47) of the `docker-compose.oauth.yml` file.


### Troubleshooting

- **I'm not able to visit `https://integrator.com` or `https://attacker.com`**.  
  Make sure you set-up your browser to use the HTTP/HTTPS proxy that runs on
  - Host: `localhost`
  - Port: `8080`
- **The certificate for `integrator.com`, `facebook.com`, ... is invalid!**  
  Install on your browser the certificate authority (CA) that you can download by visiting http://mitm.it (after configuring the proxy).
  The CA is generated on your local machine the first time you run docker-compose.
- **I installed the CA, but the certificate of `auth-server.com` is still invalid.**  
  This is an issue with recent versions of firefox. You can just add the exception for that website.

## PayPal

### Set-Up

 This case study needs to be deployed on a **public IP** address, that needs to be specified as an environment variable (`APPHOST=<IP>`) in `docker-compose.paypal.yml`.

The following steps refer to the *osCommerce* case study, they can easily be applied to the other two case studies by changing the integration specific parameters:
- return and IPN URLs in the PayPal business account settings;
- `build` and `image` directives in the `docker-compose.paypal.yml` file.

#### On PayPal Website

1. Create a sandbox business account;
2. Log into [sandbox.paypal.com](https://sandbox.paypal.com) using the newly created business account;
3. Go to **Settings** -> **Account Settings** -> **Website payments**:
   1. Under **Website preferences** enable **Auto return** and set the Return URI to `http://<YOUR IP>/checkout_process.php`;
   2. Under **Instant Payment Notification** turn on IPN messages and edit the **Notification URL** to be `http://<YOUR IP>:80/ext/modules/payment/paypal/standard_ipn.php`.

#### On Your Server

Run the e-commerce website:

```sh
docker-compose -f docker-compose.paypal.yml up --build
```

A proxy server is listening on port `9090`.
The `docker-compose` command sets up a testing environment composed of three proxies listening on the same ports as in the OAuth case study.
You need to connect to the **public IP** of the website through this proxy (`9090`) for the ca sestudy to work correctly.

1. Go to `http://<YOUR IP>/admin` and log in using the admin credentials `toto:toto`;
2. Select **Modules** -> **Payment** on the sidebar, then **PayPal Website Payments Standard** and click **Edit**:
   1. Set your business account in the **E-Mail Address** field;
   2. Select **Delivered** in the **Set PayPal Acknowledged Order Status** dropdown;
   3. Click **Save**.

The website is now configured and you can test the integration using the `user1@example.com:user1pass` account.

### Monitors

1. The proxy monitor can be enabled by decommenting [line 32](https://github.com/secgroup/bulwark-experiments/blob/master/casestudies-src/docker-compose.paypal.yml#L32) **and** [line 48](https://github.com/secgroup/bulwark-experiments/blob/master/casestudies-src/docker-compose.paypal.yml#L48) of the `docker-compose.paypal.yml` file.
