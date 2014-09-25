class Admin::Api::V1::TranslationsController < ApplicationController

  respond_to :json

  def index
    respond_with Translation.all
  end

  def show
    respond_with translation
  end
  def edit
  	respond_with translation
  end

  def create
    respond_with :admin, :api, :v1, Translation.create!(offer_params)
  end

  def update
    respond_with Translation.update(translation,translation_params)
  end

  def destroy
    respond_with translation.destroy
  end

  private

  def translation
    Translation.find(params[:id])
  end

  def translation_params
    params[:translation]
  end

end
