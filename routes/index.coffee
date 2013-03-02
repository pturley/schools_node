data = require("../data")

# GET home page.
#

exports.index = (req, res) ->
  res.render 'index', title: data[0]

