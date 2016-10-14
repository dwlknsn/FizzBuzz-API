require 'rails_helper'

describe FizzBuzzesController, type: :controller do
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

def parsed_response(response)
  JSON.parse(response.body).with_indifferent_access
end
