class InvitesController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	session[:referer_id] = params[:id]
  end

  def create
  		
  end

  def index
		@mail = ReferalEmail.new
	 @referral = Referral.find(params[:referral_id])	
		@mail.referer_id = @referral.id

  end

  def emailer

  	@mail = ReferalEmail.find(params[:emails])
  	respond_to do |format|
  		format.html {redirect_to :index, :notice=> "mail sent"  }
  	end
  	UserMailer.delay.invites_mail(@mail)

  end
 


end
