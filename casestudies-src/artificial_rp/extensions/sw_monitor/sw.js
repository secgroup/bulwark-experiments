self.importScripts("/extensions/sw_monitor/sw_include.js")
self.importScripts("/extensions/sw_monitor/sw_config_auth_server.js")

/* in(serviceWorkerFetch(b), (u:Uri, cs__1000, sw__ref:Uri, sw__p:Page, sw__aj:Ajax)) */
self.addEventListener('fetch', function(event) {
    try {
        let u = new URL(event.request.url);
        let cs__1000 = event.request;
        let sw__ref = event.request.referer;
        /* let =httpGet() = cs__1000 */
        if (!(("GET") == ((cs__1000).method))) throw new MatchFail();
        /* let uri(=https(), =h, =loginpath(), =nullParams()) = u */
        if (("https") == ((u).protocol.slice(0,-1)) && (h) == ((u).host) && (loginpath) == ((u).pathname) && ("") == ((u).search)) {
                event.respondWith((async () => {
                    try {
                        /* out(rawRequest(b), (u, cs__1000, sw__ref, sw__p, sw__aj)) */
                        var __fetchd = await fetch((u).href, {
                            method: (cs__1000).method, 
                            headers: event.request.headers,
                        });
                        /* in(serviceWorkerResult(b), (=u, cs__1100:HttpResponse, cs__1101:ReferrerPolicy, sw__foo:XDR, sw__corr:bitstring)) */
                        let cs__1100 = __fetchd;
                        let cs__1101 = __fetchd.headers['referrer-policy'];
                        /* let httpOk(pagewithlink(uri(=https(), =fb, =oauthpath(), codereqparams(=appid, =uri(https(), h, callbackpath(), nullParams()), state)))) = cs__1100 */
                        if (!((cs__1100).status == 200)) throw new MatchFail();
                        var __fetchd_body = await (cs__1100).clone().text();
                        var __pagewithlink_match = (new RegExp((u).protocol.slice(0,-1)+"://"+fb+oauthpath+"\\?"+"(?=.*?=(?:[^&]+))[^\\\"\\' ]+")).exec(__fetchd_body);
                        if (!((__pagewithlink_match))) throw new MatchFail();
                        if (!(("https") == ((new URL((__pagewithlink_match)[0])).protocol.slice(0,-1)))) throw new MatchFail();
                        if (!((fb) == ((new URL((__pagewithlink_match)[0])).host))) throw new MatchFail();
                        if (!((oauthpath) == ((new URL((__pagewithlink_match)[0])).pathname))) throw new MatchFail();
                        if (!((appid) == (codereqparams((new URL((__pagewithlink_match)[0])).search)[0]))) throw new MatchFail();
                        if (!(("https") == ((codereqparams((new URL((__pagewithlink_match)[0])).search)[1]).protocol.slice(0,-1)))) throw new MatchFail();
                        if (!((h) == ((codereqparams((new URL((__pagewithlink_match)[0])).search)[1]).host))) throw new MatchFail();
                        if (!((callbackpath) == ((codereqparams((new URL((__pagewithlink_match)[0])).search)[1]).pathname))) throw new MatchFail();
                        if (!(("") == ((codereqparams((new URL((__pagewithlink_match)[0])).search)[1]).search))) throw new MatchFail();
                        let state = codereqparams((new URL((__pagewithlink_match)[0])).search)[2];
                        /* let =unsafeUrl() = cs__1101 */
                        /* insert MRPSessions(state) */
                        await MRPSessions.insert({col_1: state})
                        /* out(serviceWorkerSendHttpResponse(b), (u, cs__1100, cs__1101, sw__foo, sw__corr)) */
                        var __response = (cs__1100)
                        if (cs__1101)
                            __response = await appendHeader(__response, 'referrer-policy', cs__1101)
                        return cleanResponse(__response);
                    } catch (e) { 
                        console.log(e)
                        console.log('Match error: '+event.request.url)
                        return errorResponse('match error!');
                    }
                })());
        } else {
            /* let uri(=https(), =h, =callbackpath(), coderesparams(code, state)) = u */
            if (("https") == ((u).protocol.slice(0,-1)) && (h) == ((u).host) && (callbackpath) == ((u).pathname)) {
                    let code = coderesparams((u).search)[0];
                    let state = coderesparams((u).search)[1];
                    event.respondWith((async () => {
                        try {
                            /* get MRPSessions(=state) in */
                            var __table_res = await MRPSessions.findOne({col_1: {$eq: state}})
                            if (!(__table_res)) throw new MatchFail();
                            if (!((state) == (__table_res.col_1))) throw new MatchFail();
                            /* out(rawRequest(b), (u, cs__1000, sw__ref, sw__p, sw__aj)) */
                            var __fetchd = await fetch((u).href, {
                                method: (cs__1000).method, 
                                headers: event.request.headers,
                            });
                            /* in(serviceWorkerResult(b), (=u, cs__1200:HttpResponse, cs__1201:ReferrerPolicy, sw__foo:XDR, sw__corr:bitstring)) */
                            let cs__1200 = __fetchd;
                            let cs__1201 = __fetchd.headers['referrer-policy'];
                            /* let =httpOk(success()) = cs__1200 */
                            if (!((cs__1200).status == 200)) throw new MatchFail();
                            var __fetchd_body = await (cs__1200).clone().text();
                            /* let =noReferrer() = cs__1201 */
                            /* out(serviceWorkerSendHttpResponse(b), (u, cs__1200, cs__1201, sw__foo, sw__corr)) */
                            var __response = (cs__1200)
                            if (cs__1201)
                                __response = await appendHeader(__response, 'referrer-policy', cs__1201)
                            return cleanResponse(__response);
                        } catch (e) { 
                            console.log(e)
                            console.log('Match error: '+event.request.url)
                            return errorResponse('match error!');
                        }
                    })());
            } else {
                /* event forwardRequest() */
            }
        }
    } catch (e) {}
});

