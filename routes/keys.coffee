keys = require("../keys")
please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, keys