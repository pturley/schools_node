ofm = require("../util/ofm")
please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, ofm.keys()