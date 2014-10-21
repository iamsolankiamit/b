class Admin::OffersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @offers =  Offer.where(:user_id => params[:user_id])
    respond_with @offers
  end

  def show
    @offer = Offer.includes(:translations,:amenity,:photos).find(params[:id])
    respond_with @offer
  end

  def new
    @offer = Offer.new()
    @offer.photos.build
    @offer.translations.build
    @offer.build_amenity
    respond_with @offer
  end

  def edit
    respond_with offer
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
      @amenity = @offer.create_amenity(params[:amenities])
    end
    if !@offer.translations
      @translations = @offer.create_translations(params[:translations])
    end
    @offer = @offer.update_attributes(offer,offer_params)
    redirect_to admin_user_offer_path(@offer.user_id, @offer.id)
  end

  def destroy
    respond_with offer.destroy
  end

  private

  def offer
    Offer.find(params[:id])
  end

  def offer_params
    params[:offer]
  end

end
