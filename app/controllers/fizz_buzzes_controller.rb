class FizzBuzzesController < ApplicationController
  def index
    number = params[:number].to_i
    result = fizz_buzz(number)
    render json: { result: result}
  end

  private

  def fizz_buzz(n)
    if n % 3 == 0 && n % 5 != 0
      :FIZZ
    elsif n % 3 != 0 && n % 5 == 0
      :BUZZ
    elsif n % 3 == 0 && n % 5 == 0
      :FIZZBUZZ
    else
      n
    end
  end
end
