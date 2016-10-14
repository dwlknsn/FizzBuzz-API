class FizzBuzzesController < ApplicationController
  def index
    result = Services::FizzBuzz.perform(params[:number])
    render json: { result: result}
  end
end
