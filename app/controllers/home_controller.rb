class HomeController < ApplicationController
  def index
  end
  def login
    render layout: "registration"
  end
end
