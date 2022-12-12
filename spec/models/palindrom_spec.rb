require 'rails_helper'


RSpec.describe 'Palindrom', type: :request do
  # Проверка на успешные get запросы
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /show' do
    it 'returns http redirection' do
      get '/example/show'
      expect(response).to have_http_status(:redirect)
    end
  end
  describe 'Add and search db(check adding to db)' do
    i = rand(1..100)
    it 'Adds correctly' do
      expect(Palindrom.create(digit: i)).not_to be_nil
      expect(Palindrom.find_by_digit(i)).not_to be_nil
    end
  end
  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      i = rand(1..100)
      t = Palindrom.create(digit: i)
      t1 = Palindrom.create(digit: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end

RSpec.describe Palindrom, type: :model do
  it 'another checks uniqueness_of field' do
    Palindrom.create!(digit: 15)
    expect { Palindrom.create!(digit: 15) }.to raise_error ActiveRecord::RecordInvalid
  end
end
