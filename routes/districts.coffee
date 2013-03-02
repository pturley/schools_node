ofm = require("./ofm")

exports.index = (req, res) ->
  sendJSON res, ofm.uniqueBy("Disctrict Name")

exports.show = (req, res) ->
  sendJSON res, ofm.uniqueBy("Disctrict Name")[req.params["id"]]

sendJSON = (res, data) ->
  json = JSON.stringify(data)
  res.setHeader 'Content-Type', 'text/plain'
  res.setHeader 'Content-Length', json.length
  res.type "json"
  res.format
    'application/json': ->
      res.send json
