module Services
  class FizzBuzz
    def self.perform(number)
      new(number).perform
    end

    def initialize(number)
      @number = number.to_i
    end

    def perform
      if number % 3 == 0 && number % 5 != 0
        :FIZZ
      elsif number % 3 != 0 && number % 5 == 0
        :BUZZ
      elsif number % 3 == 0 && number % 5 == 0
        :FIZZBUZZ
      else
        number
      end
    end

    private

    attr_reader :number
  end
end
