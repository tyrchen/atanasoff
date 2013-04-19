module.exports = (app) ->
  # Index
  app.get '/', app.ApplicationController.index

  # github
  app.get '/oauth/github', app.ApplicationController.oauth_github

  app.get '/unlink/github', app.ApplicationController.unlink_github

  app.post '/import/github/repos', app.ApplicationController.import_github_repos

  app.post '/import/github/branches', app.ApplicationController.import_github_branches

  app.post '/import/github/tree_files', app.ApplicationController.import_tree_files

  app.post '/import/github/file', app.ApplicationController.import_github_file

  app.post '/save/github', app.ApplicationController.save_github



  # Error handling (No previous route found. Assuming it’s a 404)
  app.get '/*', (req, res) ->
    NotFound res

  NotFound = (res) ->
    res.render '404', status: 404, view: 'four-o-four'
