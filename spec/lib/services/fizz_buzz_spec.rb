require 'rails_helper'

describe Services::FizzBuzzer do
  describe '.perform' do
    it 'initializes an instance and calls #perform' do
      subject = described_class
      fizz_buzzer = double(:fizz_buzzer)
      number = double(:number)
      rules = double(:rules)
      allow(subject).to receive(:new).and_return(fizz_buzzer)
      allow(fizz_buzzer).to receive(:perform)

      subject.perform(number, rules)

      expect(subject).to have_received(:new).with(number, rules)
      expect(fizz_buzzer).to have_received(:perform)
    end
  end

  describe '#perform' do
    describe 'rules for FIZZBUZZ' do
      rules = { FIZZ: 3, BUZZ: 5 }

      context 'number is divisible by 3 but not 5' do
        it 'returns FIZZ' do
          number = 3
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZ')
        end
      end

      context 'number is divisible by 5 but not 3' do
        it 'returns BUZZ' do
          number = 5
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('BUZZ')
        end
      end

      context 'number is divisible by 3 AND 5' do
        it 'returns FIZZBUZZ' do
          number = 15
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZBUZZ')
        end
      end

      context 'number is divisible by neither 3 nor 5' do
        it 'returns the number' do
          number = 1
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq(1)
        end
      end
    end

    describe 'rules for FIZZBUZZBAZZ' do
      rules = { FIZZ: 3, BUZZ: 5, BAZZ: 7 }

      context 'number is divisible by 3 but not 5 or 7' do
        it 'returns FIZZ' do
          number = 3
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZ')
        end
      end

      context 'number is divisible by 5 but not 3 or 7' do
        it 'returns BUZZ' do
          number = 5
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('BUZZ')
        end
      end

      context 'number is divisible by 7 but not 3 or 5' do
        it 'returns BAZZ' do
          number = 7
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('BAZZ')
        end
      end

      context 'number is divisible by 3 AND 5 but not 7' do
        it 'returns FIZZBUZZ' do
          number = 15
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZBUZZ')
        end
      end

      context 'number is divisible by 3 AND 7 but not 5' do
        it 'returns FIZZBAZZ' do
          number = 21
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZBAZZ')
        end
      end

      context 'number is divisible by 5 AND 7 but not 3' do
        it 'returns BUZZBAZZ' do
          number = 35
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('BUZZBAZZ')
        end
      end

      context 'number is divisible by 3 AND 5 AND 7' do
        it 'returns FIZZBUZZBAZZ' do
          number = 105
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq('FIZZBUZZBAZZ')
        end
      end

      context 'number is divisible by neither 3 nor 5' do
        it 'returns the number' do
          number = 1
          fizz_buzzer = Services::FizzBuzzer.new(number, rules)

          expect(fizz_buzzer.perform).to eq(1)
        end
      end
    end
  end
end
