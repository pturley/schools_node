express = require('express')

data = require("./data")
keys = require("./keys")

DataController = require('./routes/data')
data_controller = new DataController(data, keys)

HomePageController = require('./routes/home_page')
home_page_controller = new HomePageController()

please = require("./util/please")

http = require('http')
path = require('path')

app = express()

app.configure ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', (req, res) ->
  home_page_controller.index(req, res)
app.get '/data', (req, res) ->
  please.sendJSON res, data_controller.index(req)
app.get '/keys', (req, res) ->
  please.sendJSON res, keys

http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port " + app.get('port'))
