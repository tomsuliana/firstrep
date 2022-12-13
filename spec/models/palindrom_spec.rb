require 'rails_helper'


RSpec.describe Palindrom, type: :model do
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
  describe 'uniq field' do
    it 'another checks uniqueness_of field' do
      Palindrom.create!(digit: 15)
      expect { Palindrom.create!(digit: 15) }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end

