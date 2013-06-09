class StepsController < ApplicationController
	include Wicked::Wizard
  steps :translation, :overview, :published, :address, :photos, :pricing
  
  def create
  	@offer = Offer.new(params[:offer])
  	if @offer.save
      redirect_to steps_path, :notice => "Successfully created offer."
  	else
  		render :new
  	end
  end

  def edit
  	@offer = Offer.find(params[:id])
  end

  def show
  	@offer = 
    render_wizard
  end
end
