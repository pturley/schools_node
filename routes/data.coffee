ofm = require("../util/ofm")
please = require("../util/please")
_ = require('underscore')

exports.index = (req, res) ->
  data = ofm.filter(req.query)

  data = only_keys_asked(req, data)

  if req.query.unique
    data = _.uniq(data, (row) -> JSON.stringify(row))

  if req.query.sort_by
    data = _.sortBy(data, (row) -> row[req.query.sort_by])

  please.sendJSON res, data

only_keys_asked = (req, data) ->
  if req.query.keys
    keys = (key for key in req.query.keys when ofm.isKeyValid(key))
    if keys.length != 0
      data = (map_keys_for_object(row, keys) for row in data)
  data

map_keys_for_object = (row, keys) ->
  new_row = {}
  for key in keys
    new_row[key] = row[key]
  new_row