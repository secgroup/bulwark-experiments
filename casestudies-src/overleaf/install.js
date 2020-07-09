(function () {
    if ('serviceWorker' in navigator) {
        if (navigator.serviceWorker.controller) {
            navigator.serviceWorker.controller.postMessage({
                type: 'fetch',
                url: window.location.href
            });
        } else {
            navigator.serviceWorker.register(
                '/sw.js', {'scope': '/'}
            ).then(function(registration) {
                // Registration was successful
                console.log('ServiceWorker registration successful with scope: ', registration.scope);
                // Note that it won't control this instance of this page,
                // it only takes effect for pages in its scope
                // loaded *after* it's installed.
                window.location.reload();
            }, function(err) {
                console.log('ServiceWorker registration failed: ', err);
            });
        }
    }
})();
