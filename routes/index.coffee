ofm = require("../util/ofm")
please = require("../util/please")

exports.index = (req, res) ->
  data = ofm.filter(req.query)

  data = only_keys_asked(req, data)

  please.sendJSON res, data

only_keys_asked = (req, data) ->
  keys = (key for key in req.query.keys when ofm.isKeyValid(key))
  if keys and keys.length != 0
    data = for row in data
      do (row) ->
        new_row = {}
        for key in keys
          new_row[key] = row[key]
        new_row
  data