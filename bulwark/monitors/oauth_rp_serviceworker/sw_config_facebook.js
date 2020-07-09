
const h = "integrator.com"
const fb = "www.facebook.com"
const loginpath = "/login"
const callbackpath = "/fb-callback"
const oauthpath = "/v3.2/dialog/oauth"
const appid = "390639234906615"

let db = new zango.Db('SW', { MRPSessions: ['col_1'] })
let MRPSessions = db.collection('MRPSessions')

const codereqparams = (qs) => {
    let params = parseQuery(qs)
    return [
        params['client_id'],
        new URL(params['redirect_uri']),
        params['state']
    ]
}

const coderesparams = (qs) => {
    let params = parseQuery(qs)
    return [
        params['code'],
        params['state']
    ]
}

