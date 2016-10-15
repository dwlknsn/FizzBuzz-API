module Services
  class FizzBuzzer
    def self.perform(number, rules)
      new(number, rules).perform
    end

    def initialize(number, rules)
      @number = number.to_i
      @rules = rules || {}
    end

    def perform
      build_results_hash
      build_result_string

      result_string.empty? ? number : result_string
    end

    private

    attr_reader :number, :rules, :results_hash, :result_string

    def divisible_by?(n)
      number % n == 0
    end

    def build_results_hash
      @results_hash ||= rules.each_with_object({}) do |(k, v), hsh|
        hsh[k] = divisible_by?(v)
      end
    end

    def build_result_string
      @result_string ||= results_hash.each_with_object('') do |(k, v), str|
        str << k.to_s if v
      end
    end
  end
end
