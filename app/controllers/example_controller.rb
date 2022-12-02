# frozen_string_literal: true

# Class for controller
class ExampleController < ApplicationController
  before_action :check, only: [:show]
  def input; end

  def show
    @arr = palindroms(params[:digit].to_i)
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

  def check
    num = params[:digit]
    # return 'Empty string' if num.nil? || num.empty?

    # 'Enter numbers only' unless num.match(/^\d+$/)
    if num.nil? || num.empty?
      @error = 'Empty string'
    elsif !num.match(/^\d+$/)
      @error = 'Enter numbers only'
    end
  end
end
