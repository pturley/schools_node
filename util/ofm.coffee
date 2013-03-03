_ = require('underscore')
data = require('../data')

keys = [
  "ExamDate",
  "DistrictName",
  "CentreType",
  "CentreNo",
  "CentreName",
  "Quintile",
  "Dinaledi",
  "SubjectCode",
  "SubjectName",
  "MaleLearnersEntered",
  "FemaleLearnersEntered",
  "MaleLearnersWrote",
  "FemaleLearnersWrote",
  "MaleLearnersNotResulted",
  "FemaleLearnersNotResulted",
  "MaleLearnersPass[0-29%]",
  "FemaleLearnersPass[0-29%]",
  "MaleLearnersPass[30-39%]",
  "FemaleLearnersPass[30-39%]",
  "MaleLearnersPass[40-49%]",
  "FemaleLearnersPass[40-49%]",
  "MaleLearnersPass[50-59%]",
  "FemaleLearnersPass[50-59%]",
  "MaleLearnersPass[60-69%]",
  "FemaleLearnersPass[60-69%]",
  "MaleLearnersPass[70-79%]",
  "FemaleLearnersPass[70-79%]",
  "MaleLearnersPass[80-100%]",
  "FemaleLearnersPass[80-100%]",
  "MaleLearnersPassed30%",
  "FemaleLearnersPassed30%",
  "MaleLearnersPassed40%",
  "FemaleLearnersPassed40%"
]

exports.isKeyValid = (key) ->
  key in keys

exports.uniqueBy = (key) ->
  _.uniq(row[key] for row in data)

exports.by = (id) ->
  data[id]

exports.filter = (get_params) ->
  pre_filtered_data = data
  (pre_filtered_data = filter_single_param(key, pre_filtered_data, get_params) for key in keys when exports.isKeyValid(key))
  pre_filtered_data

filter_single_param = (key, pre_filtered_data, get_params) ->
  if get_params[key]
    (row for row in pre_filtered_data when row[key] == get_params[key])
  else
    pre_filtered_data