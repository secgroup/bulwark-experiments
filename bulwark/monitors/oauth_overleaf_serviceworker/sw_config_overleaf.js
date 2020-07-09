
const h = "www.overleaf.com"
const fb = "accounts.google.com"
const loginpath = "XXXX" // the login with button is not present
const loginredirectpath = "XXXX" // The sw cannot intercept cross-origin redirect
const callbackpath = "/users/auth/google_oauth2/callback"
const oauthpath = "/o/oauth2/v2/auth"
const appid = "47304055603.apps.googleusercontent.com"

const noState = "NOSTATE"

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

