ofm = require("../lib/ofm")
please = require("../lib/please")

exports.index = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("Disctrict Name")

exports.show = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("Disctrict Name")[req.params["id"]]
