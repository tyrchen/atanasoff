# Modules
express = require 'express'
http = require 'http'
path = require 'path'
app = express()

# Boot setup
require("#{__dirname}/../config/boot")(app)

# Configuration
app.configure ->
  port = process.env.PORT || 3000
  if process.argv.indexOf('-p') >= 0
    port = process.argv[process.argv.indexOf('-p') + 1]

  app.set 'port', port
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.static("#{__dirname}/../public")
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('LoNDon bRIdge iS fALliNg doWn')
  app.use express.cookieSession()
  app.use require('connect-assets')(src: "#{__dirname}/assets")
  app.use app.router

  package = require path.resolve(__dirname, './package.json')
  app.locals.title = package.title
  app.locals.description = package.description
  app.locals.node_version = process.version.replace('v', '')
  app.locals.env = process.env.NODE_ENV
  app.locals.readme = fs.readFileSync path.resolve(__dirname, './README.md'), 'utf-8'


app.configure 'development', ->
  app.use express.errorHandler()

# Routes
require("#{__dirname}/routes")(app)

# Server
http.createServer(app).listen app.get('port'), ->
  console.log "Express server listening on port #{app.get 'port'} in #{app.settings.env} mode"
