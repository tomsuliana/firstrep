# frozen_string_literal: false

require 'prime'

# Class for controller
class ExampleController < ApplicationController
  before_action :check, only: [:show]
  def input; end

  def show
    # @arr = palindroms(params[:digit].to_i)
    if (arr = Palindrom.find_by_digit(@digit = params[:digit]))
      @arr = arr.decoded_palindrom()
    else
      arr = Palindrom.new(digit: @digit)
      if arr.save
        @arr = arr.decoded_palindrom
      else
        redirect_to root_path, notice: arr.errors.messages[:digit][0]
      end
    end
  end

  def show_db
    render xml: Palindrom.all
  end

  # private

  # def palindrom(aaa)
  #   stra = aaa.to_s
  #   stra.reverse == stra
  # end

  # def palindroms(num)
  #   mas = []
  #   num.times do |iter|
  #     mas.push(iter) if palindrom(iter) && palindrom(iter * iter)
  #   end
  #   mas
  # end

  def check
    num = params[:digit]
    if num.nil? || num.empty?
      @error = 'Empty string'
    elsif !num.match(/^\d+$/)
      @error = 'Enter numbers only'
    end
  end
end
