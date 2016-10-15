## README

Ruby on Rails API solving the FizzBuzz problem

* ruby 2.3.1p112
* rails 4.2.6
* rspec-rails (~> 3.5, >= 3.5.2)

`git clone git@github.com:dwlknsn/FizzBuzz-API.git`

`cd FizzBuzz-API`

`bundle exec rails server`

Call the `/fizzbuzz` endpoint passing a `number` parameter.

Examples using REST client:

REQUEST: `GET http://localhost:3000/fizzbuzz?number=1`
JSON response: `{"result":"1"}`

REQUEST: `GET http://localhost:3000/fizzbuzz?number=3`
JSON response: `{"result":"FIZZ"}`

REQUEST: `GET http://localhost:3000/fizzbuzz?number=5`
JSON response: `{"result":"BUZZ"}`

REQUEST: `GET http://localhost:3000/fizzbuzz?number=15`
JSON response: `{"result":"FIZZBUZZ"}`