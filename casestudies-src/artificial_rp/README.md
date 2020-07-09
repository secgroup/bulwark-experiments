# integrator.com - Artificial RP

## Extensions

The applicationimplements a plugin system that enables a developer to easily integrate 
new IdPs and introduce vulnerabilities in the integrations.

In particular, this version of the website implements (see [extensions](./extensions)):
- AS SSO (`auth_server_sso`)
- Google SSO (`google_sso`)
- Facebook SSO (`facebook_sso`)
- VK SSO (`vk_sso`)
- Vulnerability in the check of the `state` parameter for every integration (`auth_server_state_check_vuln`, `fb_state_check_vuln`, `google_state_check_vuln`, `vk_state_check_vuln`)
- Service Worker monitor for every integration (currently configured for AS) (`sw_monitor`)
