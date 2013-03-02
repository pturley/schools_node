ofm = require("../util/ofm")
please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("Disctrict Name")

exports.show = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("Disctrict Name")[req.params["id"]]
