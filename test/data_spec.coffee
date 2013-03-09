require("should")
DataController = require("../routes/data")

describe 'DataController', ->
  describe "#index", ->
    it "only returns keys asked for", ->
      data = [{"hello": "foo"}]
      controller = new DataController(data)
      controller.test().should.equal null
