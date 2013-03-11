require("should")
DataController = require("../../controllers/data_controller")

describe 'DataController', ->
  describe "#index", ->
    it "provides all of the data when no params are passed", ->
      data = [
        {"akey": "foo"},
        {"akey": "bar"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {}}
      controller.index(request).should.eql data

    it "only returns rows asked for with a single value", ->
      data = [
        {"akey": "foo"},
        {"akey": "nope"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {akey: "foo"}}
      controller.index(request).should.eql [{"akey":"foo"}]

    it "only returns rows asked for with an array of values", ->
      data = [
        {"akey": "foo"},
        {"akey": "bar"},
        {"akey": "nope"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {akey: ["foo", "bar"]}}
      controller.index(request).should.eql [{"akey":"foo"}, {"akey":"bar"}]

    it "only returns keys asked for", ->
      data = [
        {"akey": "foo", "another_key": "nope"}
      ]
      controller = new DataController(data, ["akey", "another_key"])
      request  = {query: {keys: ["akey"]}}
      controller.index(request).should.eql [{"akey":"foo"}]

    it "only returns unique records when asked", ->
      data = [
        {"akey": "foo"},
        {"akey": "foo"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {unique: true}}
      controller.index(request).should.eql [{"akey":"foo"}]

    it "doesn't change the order of the data if no sort param is passed", ->
      data = [
        {"akey": "b"},
        {"akey": "a"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {}}
      controller.index(request).should.eql [{"akey":"b"}, {"akey":"a"}]

    it "sorts records by a key provided", ->
      data = [
        {"akey": "b"},
        {"akey": "a"}
      ]
      controller = new DataController(data, ["akey"])
      request  = {query: {sort_by: "akey"}}
      controller.index(request).should.eql [{"akey":"a"}, {"akey":"b"}]