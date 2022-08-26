class SinsuiController < ApplicationController
  def index
    @stage = Sinsui.new
  end
end
