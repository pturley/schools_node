please = require("../util/please")

class KeysController
  constructor: (@keys) ->

  index : (req, res) ->
    please.sendJSON res, @keys

module.exports = KeysController