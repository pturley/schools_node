please = require("../util/please")
_ = require('underscore')

exports.index = (req, res) ->
  data = global['data']

  unique_schools = _.uniq({"ExamDate": row["Exam Date"], "DistrictName":row["Disctrict Name"], "CentreType": row["Centre Type"], "CentreNo": row["Centre No"], "CentreName": row["Centre Name"], "Quintile": row["Quintile"], "Dinaledi": row["Dinaledi"], "SubjectCode": row["SubjectCode"], "SubjectName": row["SubjectName"], "MaleLearnersEntered": "", "FemaleLearnersEntered": "", "MaleLearnersWrote": "", "FemaleLearnersWrote": "", "MaleLearnersNotResulted": "", "FemaleLearnersNotResulted": "", "MaleLearnersPass[0-29%]": "", "FemaleLearnersPass[0-29%]", "", "MaleLearnersPass[30-39%]": "", "FemaleLearnersPass[30-39%]", "", "MaleLearnersPass[40-49%]": "", "FemaleLearnersPass[40-49%]", "", "MaleLearnersPass[50-59%]": "", "FemaleLearnersPass[50-59%]", "", "MaleLearnersPass[60-69%]": "", "FemaleLearnersPass[60-69%]", "", "MaleLearnersPass[70-79%]": "", "FemaleLearnersPass[70-79%]", "", "MaleLearnersPass[80-100%]": "", "FemaleLearnersPass[80-100%]", "", "MaleLearnersPassed30%", "", "FemaleLearnersPassed30%", "", "MaleLearnersPassed40%", "", "FemaleLearnersPassed40%", ""} for row in global['data'], (x) -> JSON.stringify(x))

  (update_unique_schools(unique_schools, row) for row in data)
  please.sendJSON res, unique_schools

update_unique_schools = (unique_schools, row) ->
  if row["Gender"] == "Female"
    (update_unique_school_female(unique_schools_row, row) for unique_schools_row in unique_schools)
  else
    (update_unique_school_male(unique_schools_row, row) for unique_schools_row in unique_schools)

update_unique_school_female = (unique_schools_row, row) ->
  if unique_schools_row["ExamDate"] == row["Exam Date"] and unique_schools_row["DistrictName"] == row["Disctrict Name"] and unique_schools_row["CentreType"] == row["Centre Type"] and unique_schools_row["CentreNo"] == row["Centre No"] and unique_schools_row["CentreName"] == row["Centre Name"] and unique_schools_row["Quintile"] == row["Quintile"] and unique_schools_row["Dinaledi"] == row["Dinaledi"] and unique_schools_row["SubjectCode"] == row["SubjectCode"] and unique_schools_row["SubjectName"] == row["SubjectName"]
    unique_schools_row["FemaleLearnersEntered"] = row["LearnersEntered"]
    unique_schools_row["FemaleLearnersWrote"] = row["LearnersWrote"]
    unique_schools_row["FemaleLearnersNotResulted"] = row["LearnersNot Resulted"]
    unique_schools_row["FemaleLearnersPass[0-29%]"] = row["LearnersPass [0-29%]"]
    unique_schools_row["FemaleLearnersPass[30-39%]"] = row["LearnersPass [30-39%]"]
    unique_schools_row["FemaleLearnersPass[40-49%]"] = row["LearnersPass [40-49%]"]
    unique_schools_row["FemaleLearnersPass[50-59%]"] = row["LearnersPass [50-59%]"]
    unique_schools_row["FemaleLearnersPass[60-69%]"] = row["LearnersPass [60-69%]"]
    unique_schools_row["FemaleLearnersPass[70-79%]"] = row["LearnersPass [70-79%]"]
    unique_schools_row["FemaleLearnersPass[80-100%]"] = row["LearnersPass [80-100%]"]
    unique_schools_row["FemaleLearnersPassed30%"] = row["LearnersPassed 30%"]
    unique_schools_row["FemaleLearnersPassed40%"] = row["LearnersPassed 40%"]

update_unique_school_male = (unique_schools_row, row) ->
  if unique_schools_row["ExamDate"] == row["Exam Date"] and unique_schools_row["DistrictName"] == row["Disctrict Name"] and unique_schools_row["CentreType"] == row["Centre Type"] and unique_schools_row["CentreNo"] == row["Centre No"] and unique_schools_row["CentreName"] == row["Centre Name"] and unique_schools_row["Quintile"] == row["Quintile"] and unique_schools_row["Dinaledi"] == row["Dinaledi"] and unique_schools_row["SubjectCode"] == row["SubjectCode"] and unique_schools_row["SubjectName"] == row["SubjectName"]
    unique_schools_row["MaleLearnersEntered"] = row["LearnersEntered"]
    unique_schools_row["MaleLearnersWrote"] = row["LearnersWrote"]
    unique_schools_row["MaleLearnersNotResulted"] = row["LearnersNot Resulted"]
    unique_schools_row["MaleLearnersPass[0-29%]"] = row["LearnersPass [0-29%]"]
    unique_schools_row["MaleLearnersPass[30-39%]"] = row["LearnersPass [30-39%]"]
    unique_schools_row["MaleLearnersPass[40-49%]"] = row["LearnersPass [40-49%]"]
    unique_schools_row["MaleLearnersPass[50-59%]"] = row["LearnersPass [50-59%]"]
    unique_schools_row["MaleLearnersPass[60-69%]"] = row["LearnersPass [60-69%]"]
    unique_schools_row["MaleLearnersPass[70-79%]"] = row["LearnersPass [70-79%]"]
    unique_schools_row["MaleLearnersPass[80-100%]"] = row["LearnersPass [80-100%]"]
    unique_schools_row["MaleLearnersPassed30%"] = row["LearnersPassed 30%"]
    unique_schools_row["MaleLearnersPassed40%"] = row["LearnersPassed 40%"]