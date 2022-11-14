class ExampleController < ApplicationController
  def input
  end

  def show
    @digit = (1..params[:repeater].to_i).map {params[:digit]}.join
  end
end
