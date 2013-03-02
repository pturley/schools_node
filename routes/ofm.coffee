# data = require("../data")
_ = require('underscore')

exports.uniqueBy = (key) ->
  _.uniq(row[key] for row in data)

exports.by = (id) ->
  data[id]
