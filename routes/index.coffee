please = require("../util/please")

exports.index = (req, res) ->
  please.sendJSON res, global['data']
