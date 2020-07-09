////////////////////////////////////////////////////////////////////////////////
// LIB

self.importScripts("https://unpkg.com/zangodb@1.0.7/dist/zangodb.min.js")
	
const parseQuery = (n) => n.replace('?','').split('&').reduce((s,c) => {
    let t = c.split('=');
    s[t[0]] = decodeURIComponent(t[1]); return s;
},{})

function errorResponse(error) {
    return new Response("<h1>Error</h1><i>"+ error +"</i>", {
        status: 418,
        statusText: "I'm a teapot",
        headers: {
            'Content-Type': 'text/html'
        }
    });
}

async function appendHeader(response, h, v) {
    const newHeaders = new Headers(response.headers);
    newHeaders.set(h, v);
    let body = await response.blob()
    return new Response(body, {
        status: response.status,
        statusText: response.statusText,
        headers: newHeaders
    })
}

const unsafeUrl = 'unsafe-url'
const noReferrer = 'no-referrer'

//function MatchFail() {}
MatchFail = Error



function cleanResponse(response) {
    const clonedResponse = response.clone();

    // Not all browsers support the Response.body stream, so fall back to reading
    // the entire body into memory as a blob.
    const bodyPromise = 'body' in clonedResponse ?
                        Promise.resolve(clonedResponse.body) :
                        clonedResponse.blob();

    return bodyPromise.then((body) => {
        // new Response() is happy when passed either a stream or a Blob.
        return new Response(body, {
            headers: clonedResponse.headers,
            status: clonedResponse.status,
            statusText: clonedResponse.statusText,
        });
    });
}
