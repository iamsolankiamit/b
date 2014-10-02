class Admin::OffersController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    respond_with Offer.includes(:user).where('user.lister_id = ?', current_user.id ).all
  end

  def show
    respond_with offer
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
    @offer = Offer.create!(offer_params)
    # @offer.build_amenity
    redirect_to admin_users_path
    respond_with :admin, @offer
  end

  def update
    respond_with Offer.update(offer,offer_params)
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
