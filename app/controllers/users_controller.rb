class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = Offer.where(:user_id => params[:id],:visiblity => true).all
  end
end
