ofm = require("../util/ofm")
please = require("../util/please")

exports.index = (req, res) ->
  data = ofm.filter(req.query)
  please.sendJSON res, data
