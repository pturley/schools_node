_ = require('underscore')

exports.uniqueBy = (key) ->
  _.uniq(row[key] for row in global['data'])

exports.by = (id) ->
  global['data'][id]
