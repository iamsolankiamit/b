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
    session[:passthru] = offer_path(@offer)
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
      if current_user
        redirect_to edit_offer_details_path(@offer), :notice => "successfully created offer"
      else
        redirect_to new_user_registration_path(:passthru => edit_offer_details_path(@offer)), :notice => "To complete please fill in the details below"
      end
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
    if @offer.update_attributes(params[:offer])
      redirect_to :back, :notice  => "Successfully updated offer, fill in other information if missed."
    else
      redirect_to :back, :notice => "Offer not updated successfully."
    end
  end

  def destroy
    @offer = current_user.offers.find(params[:id])
    @offer.destroy
    redirect_to offers_url, :notice => "Successfully destroyed offer."
  end

end
