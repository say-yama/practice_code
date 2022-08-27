class SinsuiController < ApplicationController
  def index
    @stage = Sinsui.new
    session[:sinsui] = @stage.get
  end

  def show
    @stage = Sinsui.new(session[:sinsui])
    @stage.open(params[:id].to_i)
    session[:sinsui] = @stage.get
    render :index
  end
end
