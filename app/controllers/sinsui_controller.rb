class SinsuiController < ApplicationController
  def index
    @stage = Sinsui.new
  end

  def show
    @stage = Sinsui.new
    @stage.open(params[:id].to_i)
    render :index
  end
end
