require 'rails_helper'

describe Services::FizzBuzz do
  describe '.perform' do
    it 'initializes an instance and calls #perform' do
      number = 1
      fizz_buzz = double(:fizz_buzz)
      subject = described_class

      allow(subject).to receive(:new).and_return(fizz_buzz)
      allow(fizz_buzz).to receive(:perform)

      subject.perform(number)

      expect(subject).to have_received(:new).with(number)
      expect(fizz_buzz).to have_received(:perform)
    end
  end

  describe '#perform' do
    context 'number is divisible by 3 but not 5' do
      it 'returns FIZZ' do
        fizz_buzz = Services::FizzBuzz.new(3)

        expect(fizz_buzz.perform).to eq(:FIZZ)
      end
    end

    context 'number is divisible by 5 but not 3' do
      it 'returns BUZZ' do
        fizz_buzz = Services::FizzBuzz.new(5)

        expect(fizz_buzz.perform).to eq(:BUZZ)
      end
    end

    context 'number is divisible by 3 AND 5' do
      it 'returns FIZZBUZZ' do
        fizz_buzz = Services::FizzBuzz.new(15)

        expect(fizz_buzz.perform).to eq(:FIZZBUZZ)
      end
    end

    context 'number is divisible by neither 3 nor 5' do
      it 'returns the number' do
        fizz_buzz = Services::FizzBuzz.new(1)

        expect(fizz_buzz.perform).to eq(1)
      end
    end
  end
end
