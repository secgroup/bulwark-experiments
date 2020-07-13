# Overleaf Session Swapping (fixed)

The lack of the `state` parameter in the Overleaf implementation of
OAuth 2.0 with Google introduced known vulnerabilities.
In particular it was possible to mount a session-swapping attack through a CSRF on the Google Oauth2 callback page at `/users/auth/google_oauth2/callback`. A PoC attack can be found in the [poc.html](./poc.html) file.

The vulnerability have been reported to Overleaf developers, that acknowledged the vulnerability and fixed the issue by adding the `state` parameter.

## Monitor

```sh
mitmproxy -p 8080 -s install_serviceworker.py
```

The proxy rewrites the `<head>` element of every page in the `overleaf.com` origin to inject the following script tag
```html
<script src="install.js"></script>
```

The `install.js` script installs the service worker monitor on the Overleaf scope.

