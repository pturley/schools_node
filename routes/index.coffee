data = require("../data")
please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, data
