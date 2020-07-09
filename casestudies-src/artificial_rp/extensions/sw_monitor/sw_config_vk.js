
const h = "integrator.com"
const fb = "oauth.vk.com"
const loginpath = "/login"
const callbackpath = "/vk-verify"
const oauthpath = "/authorize"
const appid = "7054259"

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

