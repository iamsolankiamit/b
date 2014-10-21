class Admin::OffersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @offers =  Offer.where(:user_id => params[:user_id])
  end

  def show
    @offer = Offer.includes(:translations,:amenity,:photos).find(params[:id])
  end

  def new
    @offer = Offer.new()
    @offer.photos.build
    @offer.translations.build
    @offer.build_amenity
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer.translations.build(params[:id])
    @offer.build_amenity(params[:id])
    @offer = Offer.create!(offer_params)
    redirect_to admin_user_offer_photos_path(@offer.user_id,@offer.id)
  end

  def update
    @offer = Offer.find(params[:id])
    if !@offer.amenity
      @amenity = @offer.build_amenity
      @amenity = @offer.create_amenity(params[:offer][:amenity_attributes])
    end
    if !@offer.translations
      @translations = @offer.create_translations(params[:translations])
    end
     if @offer.update_attributes(params[:offer])
      redirect_to admin_user_offer_path @offer.user_id, @offer.id , :notice  => "Successfully updated offer, fill in other information if missed."
    else
      redirect_to :back, :notice => "Offer not updated successfully."
    end
  end

  def destroy
  end

  private

  def offer
    Offer.find(params[:id])
  end

  def offer_params
    params[:offer]
  end

end
