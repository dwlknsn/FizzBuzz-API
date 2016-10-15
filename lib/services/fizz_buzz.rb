module Services
  class FizzBuzz
    def self.perform(number)
      new(number).perform
    end

    def initialize(number)
      @number = number.to_i
    end

    def perform
      if divisible_by_3? && !divisible_by_5?
        :FIZZ
      elsif !divisible_by_3? && divisible_by_5?
        :BUZZ
      elsif divisible_by_3? && divisible_by_5?
        :FIZZBUZZ
      else
        number
      end
    end

    private

    attr_reader :number

    # def divisible_by_3?
    #   @divisible_by_3 ||= number % 3 == 0
    # end

    # def divisible_by_5?
    #   @divisible_by_5 ||= number % 5 == 0
    # end

    [3, 5].each do |n|
      define_method "divisible_by_#{n}?" do
        number % n == 0
      end
    end
  end
end
