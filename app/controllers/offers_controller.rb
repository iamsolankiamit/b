class OffersController < ApplicationController

  before_filter :authenticate_user!, :except => [:show,:new,:create]
  load_and_authorize_resource

  def overview
    @offer = current_user.offers.find(params[:id])
  end
  def index
    @offers = current_user.offers.all
  end

  def show
    @offer = Offer.find(params[:id])
    @inquiry = Inquiry.new()
    @inquiry.messages.build()
    session.delete(:passthru)
    unless current_user
      session[:passthru] = offer_path(@offer)
    end
    session[:recently_viewed_offers] ||= []
    session[:recently_viewed_offers] << @offer.id
    session[:recently_viewed_offers].delete_at(0) if session[:recently_viewed_offers].size > 4
    @hash = Gmaps4rails.build_markers(@offer) do |offer, marker|
      marker.lat offer.confidential_lat
      marker.lng offer.confidential_lng
    end
  end

  def new
    @offer = Offer.new
    @offer.photos.build

  end

  def create
    @offer = current_or_guest_user.offers.new(params[:offer])
    @offer.translations.build(params[:id])
    @offer.build_amenity(params[:id])
    if @offer.save
      redirect_to edit_offer_wizard_step_path(@offer, 'address')
      session[:passthru] = edit_offer_details_path(@offer)
    else
      render :new
    end
  end

  def update
    @offer = current_user.offers.find(params[:id])
    if !@offer.amenity
      @amenity = @offer.build_amenity
      @amenity = @offer.create_amenity(params[:amenities])
    end
    if !@offer.translations
      @translations = @offer.create_translations(params[:translations])
    end
    if @offer.update_attributes(params[:offer])
      redirect_to :back, :notice  => "Successfully updated offer, fill in other information if missed."
    else
      Rails.logger.debug( "translation error ==== #{@offer.errors.full_messages}")
      redirect_to :back, :notice => "Offer not updated successfully. translation error #{@offer.inspect} ==== #{@offer.errors}"
    end
  end

  def destroy
    @offer = current_user.offers.find(params[:id])
    @offer.destroy
    redirect_to offers_url, :notice => "Successfully destroyed offer."
  end

end
