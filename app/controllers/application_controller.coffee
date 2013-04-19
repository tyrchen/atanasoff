Github = require( path.resolve(__dirname, '../plugins/github/github.js') ).Github

module.exports = (app) ->
  class app.ApplicationController

    # GET /
    @index = (req, res) ->
      res.render 'index',
        view: 'index'


    @oauth_github = (req, res, next) ->
      code = req.query.code
      if not code
        next()
      else
        req.session.oauth = {}

        client_id = Github