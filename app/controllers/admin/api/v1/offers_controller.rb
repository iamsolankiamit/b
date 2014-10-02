class Admin::Api::V1::OffersController < ApplicationController

  respond_to :json

  def index
    respond_with Offer.includes(:user).where('user.lister_id = ?',params[:id]).all
  end

  def show
    respond_with offer
  end
  def edit
  	respond_with offer
  end

  def create
    @translation = Translation.new(params[:offer][:translations])
    respond_with :admin, :api, :v1, Offer.create!(offer_params)
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
