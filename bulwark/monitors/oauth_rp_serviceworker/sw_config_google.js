
const h = "integrator.com"
const fb = "accounts.google.com"
const loginpath = "/login"
const callbackpath = "/google-verify"
const oauthpath = "/o/oauth2/auth"
const appid = "996805361802-2tbmasivof6joftmsfqtgcuehpuokl71.apps.googleusercontent.com"

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

