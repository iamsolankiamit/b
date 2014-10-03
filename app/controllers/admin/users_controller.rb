class Admin::UsersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @users = User.where("guest_account is ? and lister_id = ?", nil, current_user.id)
    respond_with @users
  end

  def show
    respond_with user
  end
  
  def new
    @users = User.where("guest_account is ? and lister_id = ?", nil, current_user.id)
  end

  def edit
    respond_with user
  end

  def create
    respond_with :admin , User.create!(new_user_params)
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
