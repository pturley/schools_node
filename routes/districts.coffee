ofm = require("../util/ofm")
please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("DistrictName")

exports.show = (req, res) ->
  please.sendJSON res, ofm.uniqueBy("DistrictName")[req.params["id"]]
