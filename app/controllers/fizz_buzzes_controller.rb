class FizzBuzzesController < ApplicationController
  def index
    number = params[:number]
    rules = { FIZZ: 3, BUZZ: 5 }
    result = Services::FizzBuzzer.perform(number, rules)
    render json: { result: result }
  end
end
