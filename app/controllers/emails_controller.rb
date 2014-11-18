class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = Email.new(params[:email])
    @email.save!
    redirect_to emails_path
  end

  def index
  end
end
