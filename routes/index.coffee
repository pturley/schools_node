data = require("../data")
please = require("../lib/please")

exports.index = (req, res) ->
  please.sendJSON res, data
