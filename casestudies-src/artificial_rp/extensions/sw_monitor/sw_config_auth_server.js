
const h = "integrator.com"
const fb = "auth-server.com"
const loginpath = "/login"
const callbackpath = "/as-verify"
const oauthpath = "/oauth2/auth"
const appid = "67538654696"

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

