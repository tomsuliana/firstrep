class Palindrom < ApplicationRecord
  validates_uniqueness_of :digit, :arr, message: 'Введено не число'
  validates :digit, format: { with: /\A\d+\z/, message: 'Введите что-то' }
  before_save :set_palindrom
  def decoded_palindrom
    ActiveSupport::JSON.decode(arr)
  end

  private

  def set_palindrom
    self.arr = ActiveSupport::JSON.encode(calculate_palindrom)
  end

  def calculate_palindrom
    mas = []
    digit.times do |iter|
      mas.push(iter) if palindromis(iter) && palindromis(iter * iter)
    end
    mas
  end

  def palindromis(aaa)
    stra = aaa.to_s
    stra.reverse == stra
  end
end
