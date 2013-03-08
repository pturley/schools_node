The Project
===========

This is an extensible API for data related to the Eastern Cape in South Africa's educational statistics.

The API
=======

* `/keys` will give you a list of all of the possible keys inside each data point.  These keys can be used for filtering and retrieving partial records
* `/data` is where you can retrieve the data that you require.  Many parameters can be added to this url for filtering and other data actions

The parameters that may be added to `/data` are:

* Any key for filtering
  * A single key will remove any records that dont match the value provided. (ex. `?ExamDate=2009`)
  * Arrays can also be processed and any record that matches any of the provided values will be returned. (ex. `?ExamDate[0]=2009&ExamDate[1]=2010`)
  * These keys may be combined to create more complex queries
* An array of keys can be passed using the keyword `keys` to retrieve the keys requested. (ex. `?keys[0]=ExamDate`)
* A key of `unique` may be passed to only return the unique records in the dataset. (ex. `?ExamDate=2009&keys[0]=ExamDate&unique=true`)
* A key of `sort_by` will sort the results by the key specified. (ex. `?ExamDate=2009&sort_by=DistrictName`)


Go Fork it!
===========

This project originally came out of a [Coded in Braam](http://www.codedinbraam.co.za) meetup in Johannesburg, SA at the ThoughtWorks office on March 2, 2013.

The source code for this API is located [here](https://github.com/pturley/schools_node)

Development Setup
=================

1. Clone the github repo
1. Install node.js (`brew install node` on mac)
1. cd to repository
1. npm install
1. npm install foreman
1. foreman start
1. Navigate to localhost:5000 to see this page running locally
1. `make` to run the tests