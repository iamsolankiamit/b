class InvitesController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	session[:referer_id] = params[:id]
  end

  def create
  		
  end

  def index
  end

  def emailer
    refferal = ReferalEmail.add_manual_contacts(params[:referral_email][:referer_id], params[:referral_email][:email])
  	respond_to do |format|
  	  format.js 
  	end

  end
 


end
