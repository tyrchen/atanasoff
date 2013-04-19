fs = require('fs')
path = require('path')
request = require('request')

config = JSON.parse fs.readFileSync(path.resolve(__dirname, 'config.json'), 'utf-8')

exports.Github = (->
  api_url = "https://api.github.com/"
  auth_url = "https://github.com/login/oauth/authorize?client_id=#{config.client_id}" +
           + "redirect_uri=#{config.redirect_uri}&scope=#{config.scope}"

  return {
    config: config,
    generateAuthUrl
  }
)()