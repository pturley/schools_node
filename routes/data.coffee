_ = require('underscore')

class DataController
  constructor: (@data, @keys) ->

  index: (req) ->
    data = this._filter(req.query, @data)
    data = this._only_keys_asked(req.query, data)
    data = this._only_unique_if_asked(req.query, data)
    this._sort(req.query, data)

  _filter: (get_params, data) ->
    pre_filtered_data = data
    (pre_filtered_data = this._filter_single_param(key, pre_filtered_data, get_params) for key in @keys)
    pre_filtered_data

  _filter_single_param: (key, pre_filtered_data, get_params) ->
    if get_params[key]
      (row for row in pre_filtered_data when row[key] in _.flatten([get_params[key]]))
    else
      pre_filtered_data

  _only_keys_asked: (get_params, data) ->
    if get_params.keys
      keys = (key for key in get_params.keys when key in @keys)
      if keys.length != 0
        data = (this._map_keys_for_object(row, keys) for row in data)
    data

  _map_keys_for_object: (row, keys) ->
    new_row = {}
    for key in keys
      new_row[key] = row[key]
    new_row

  _only_unique_if_asked: (get_params, data) ->
    if get_params.unique
      _.uniq(data, (row) -> JSON.stringify(row))
    else
      data

  _sort: (get_params, data) ->
    if get_params.sort_by
      _.sortBy(data, (row) -> row[get_params.sort_by])
    else
      data

module.exports = DataController

