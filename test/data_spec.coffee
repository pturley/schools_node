require("should")
DataController = require("../routes/data")

describe 'DataController', ->
  describe "#index", ->
    it "only returns rows asked for", ->
      data = [
        {"akey": "foo"},
        {"akey": "nope"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {akey: "foo"}}
      controller.index(request).should.eql [{"akey":"foo"}]

    it "only returns keys asked for", ->
      data = [
        {"akey": "foo", "another_key": "nope"}
      ]
      controller = new DataController(data, ["akey", "another_key"])
      request  = {query: {keys: ["akey"]}}
      controller.index(request).should.eql [{"akey":"foo"}]
