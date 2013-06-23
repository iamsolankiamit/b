class FloodsController < ApplicationController
  # GET /floods
  # GET /floods.json
  def index
    @floods = Flood.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @floods }
    end
  end

  # GET /floods/new
  # GET /floods/new.json
  def new
    @flood = Flood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flood }
    end
  end

  # POST /floods
  # POST /floods.json
  def create
    @flood = Flood.new(params[:flood])

    respond_to do |format|
      if @flood.save
        format.html { redirect_to root_path, notice: 'Listing was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @flood.errors, status: :unprocessable_entity }
      end
    end
  end

end
