# frozen_string_literal: true

# Class for controller
class ExampleController < ApplicationController
  def input; end

  def show
    num = params[:digit]
    flash[:error] = check(num)

    redirect_to root_path unless flash[:error].nil?

    @arr = palindroms(num.to_i)
  end

  private

  def palindrom(aaa)
    stra = aaa.to_s
    stra.reverse == stra
  end

  def palindroms(num)
    mas = []
    num.times do |iter|
      mas.push(iter) if palindrom(iter) && palindrom(iter * iter)
    end
    mas
  end

  def check(num)
    return 'Empty string' if num.nil? || num.empty?

    'Enter numbers only' unless num.match(/^\d+$/)
  end
end
