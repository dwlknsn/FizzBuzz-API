require 'rails_helper'

describe FizzBuzzesController, type: :controller do
  describe '#index' do
    it 'calls Services::FizzBuzzer.perform and returns the correct json' do
      number = 3
      rules = { FIZZ: 3, BUZZ: 5 }
      result = { result: 'FIZZ' }.to_json
      allow(Services::FizzBuzzer).to receive(:perform).and_return('FIZZ')

      get :index, { number: number }

      expect(Services::FizzBuzzer).to have_received(:perform).with(number.to_s, rules)
      expect(response.body).to eq(result)
    end
  end

  describe 'GET INDEX /fizzbuzz/:number' do
    context 'divisible by 3 but not 5' do
      it 'returns FIZZ' do
        get :index, { number: 3 }

        response_body = parsed_response(response)

        expect(response_body[:result]).to eq('FIZZ')
      end
    end

    context 'divisible by 5 but not 3' do
      it 'returns BUZZ' do
        get :index, { number: 5 }

        response_body = parsed_response(response)

        expect(response_body[:result]).to eq('BUZZ')
      end
    end

    context 'divisible by 3 AND 5' do
      it 'returns FIZZBUZZ' do
        get :index, { number: 15 }

        response_body = parsed_response(response)

        expect(response_body[:result]).to eq('FIZZBUZZ')
      end
    end

    context 'divisible by neither 3 nor 5' do
      it 'returns the number' do
        get :index, { number: 2 }

        response_body = parsed_response(response)

        expect(response_body[:result]).to eq(2)
      end
    end
  end
end
