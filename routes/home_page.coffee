exports.index = (req, res) ->
  fs = require("fs")
  md = require("node-markdown").Markdown
  fs.readFile("Readme.md", "utf8", (err, data) -> res.render 'home_page', {md:md, content:data})
