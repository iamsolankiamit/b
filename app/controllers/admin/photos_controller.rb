class Admin::PhotosController < ApplicationController

skip_before_filter  :verify_authenticity_token
  def index
    @photos = Photo.find(:all,:conditions => ["offer_id = ?", params[:offer_id]])
  end

  def new
    @photo = Photo.new
    respond_to do |format|
      format.json { render json: @photo }
      format.html
    end
  end

  def show
    @photo = Photo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def create
    @photo = Photo.new(params[:photo])
    @photo.offer_id = params[:offer_id]
    respond_to do |format|
      if @photo.save!
        format.js 
      else
        format.js 
      end
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to offers_url, :notice  => "Successfully updated offer."
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to offer_photos_url }
      format.json { head :no_content }
    end
  end

end
