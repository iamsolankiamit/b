class HomeController < ApplicationController
  def index
  	@floods = Flood.all
  end
end
