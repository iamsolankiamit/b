class OffersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]
  def index
    @offers = current_user.offers.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = current_user.offers.new(params[:offer])
    if @offer.save
      redirect_to @offer, :notice => "Successfully created offer."
    else
      render :action => 'new'
    end
  end

  def edit
    @offer = current_user.Offer.find(params[:id])
  end

  def update
    @offer = current_user.Offer.find(params[:id])
    if @offer.update_attributes(params[:offer])
      redirect_to @offer, :notice  => "Successfully updated offer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @offer = current_user.Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_url, :notice => "Successfully destroyed offer."
  end
end
