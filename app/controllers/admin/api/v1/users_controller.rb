class Admin::Api::V1::UsersController < ApplicationController

  respond_to :json

  def index
    respond_with User.where("guest_account is ?", nil).first
  end

  def show
    respond_with user
  end
  def edit
  	respond_with user
  end

  def create
    respond_with :admin, :api, :v1, User.create!(new_user_params)
  end

  def update
    respond_with User.update(user,user_params)
  end

  def destroy
    respond_with user.destroy
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    params[:user]
  end

  def random_password
    Devise.friendly_token.first(8)
  end

  def new_user_params
    params[:user].merge(password: random_password)
  end
end
