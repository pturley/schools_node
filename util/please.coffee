keys = require('../keys')
_ = require('underscore')

exports.filter = (get_params, data) ->
  pre_filtered_data = data
  (pre_filtered_data = filter_single_param(key, pre_filtered_data, get_params) for key in keys)
  pre_filtered_data

exports.sendJSON = (res, data) ->
  json = JSON.stringify(data)
  res.setHeader 'Content-Type', 'text/plain'
  res.setHeader 'Content-Length', json.length
  res.type "json"
  res.format
    'application/json': ->
      res.send json

filter_single_param = (key, pre_filtered_data, get_params) ->
  if get_params[key]
    (row for row in pre_filtered_data when row[key] in _.flatten([get_params[key]]))
  else
    pre_filtered_data
