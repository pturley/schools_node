please = require("../util/please")
keys = require('../keys')
_ = require('underscore')

class DataController
  constructor: (@data) ->

  test: () ->
    @data

  index: (req, res) ->
    data = please.filter(req.query, @data)

    data = this._only_keys_asked(req, data)

    if req.query.unique
      data = _.uniq(data, (row) -> JSON.stringify(row))

    if req.query.sort_by
      data = _.sortBy(data, (row) -> row[req.query.sort_by])

    please.sendJSON res, data

  _only_keys_asked: (req, data) ->
    if req.query.keys
      keys = (key for key in req.query.keys when key in keys)
      if keys.length != 0
        data = (this._map_keys_for_object(row, keys) for row in data)
    data

  _map_keys_for_object: (row, keys) ->
    new_row = {}
    for key in keys
      new_row[key] = row[key]
    new_row

module.exports = DataController

