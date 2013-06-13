class OffersController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  load_and_authorize_resource

  def index
    @offers = current_user.offers.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @offer.photos.build
  end

  def create
    @offer = current_user.offers.new(params[:offer])
    @offer.translations.build(params[:id])
    @photo = @offer.uploads.last
    if @offer.save
      redirect_to edit_offer_translations_path(@offer), :notice => "Successfully created offer, now fill in other details."
      format.html { render :json => [@photo.to_jq_upload].to_json, :content_type => 'text/html',:layout => false }
    else
      render :new
    end
  end

  def edit
    @offer = current_user.offers.find(params[:id])
    @offer.photos.build
  end

  def update
    @offer = current_user.offers.find(params[:id])
    if @offer.update_attributes(params[:offer])
      redirect_to @offer, :notice  => "Successfully updated offer."
    else
      render :edit
    end
  end

  def destroy
    @offer = current_user.offers.find(params[:id])
    @offer.destroy
    redirect_to offers_url, :notice => "Successfully destroyed offer."
  end

end
