class ExampleController < ApplicationController
  def input
  end

  def show
    @digit = (1..params[:repeater].to_i).map {params[:digit]}.join
    @num = params[:digit].to_i
  end
end
