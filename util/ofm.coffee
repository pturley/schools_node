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
  "MaleLearnersPass0-29",
  "FemaleLearnersPass0-29",
  "MaleLearnersPass30-39",
  "FemaleLearnersPass30-39",
  "MaleLearnersPass40-49",
  "FemaleLearnersPass40-49",
  "MaleLearnersPass50-59",
  "FemaleLearnersPass50-59",
  "MaleLearnersPass60-69",
  "FemaleLearnersPass60-69",
  "MaleLearnersPass70-79",
  "FemaleLearnersPass70-79",
  "MaleLearnersPass80-100",
  "FemaleLearnersPass80-100",
  "MaleLearnersPassed30",
  "FemaleLearnersPassed30",
  "MaleLearnersPassed40",
  "FemaleLearnersPassed40"
]

exports.isKeyValid = (key) ->
  key in keys

exports.filter = (get_params) ->
  pre_filtered_data = data
  (pre_filtered_data = filter_single_param(key, pre_filtered_data, get_params) for key in keys)
  pre_filtered_data

filter_single_param = (key, pre_filtered_data, get_params) ->
  if get_params[key]
    (row for row in pre_filtered_data when row[key] in _.flatten([get_params[key]]))
  else
    pre_filtered_data