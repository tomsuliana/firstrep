class ExampleController < ApplicationController

  def input
  end

  def show
    num = params[:digit]
    flash[:error] = check(num)
    
    if !flash[:error].nil?
      redirect_to root_path
    end

    @arr = palindroms(num.to_i)

  end

  private

  def is_palindrom(a) 
    temp = a
    b = 0
    while (temp!=0) 
      b = b *10 + temp % 10
      temp /=10
    end
    a == b
  end



  def palindroms(num)
    mas = []
    num.times do |i|
      if is_palindrom(i) && is_palindrom(i*i) then
        mas.push(i)
      end
    end
    mas
  end

  def check(num)
    if num.nil? || num.empty?
      return 'Empty string'
    end
    if !num.match(/^\d+$/)
      return 'Enter numbers only'
    end
  end
end
