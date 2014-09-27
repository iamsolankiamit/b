class SunburnSystemsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /sunburn_systems
  # GET /sunburn_systems.json
  def index
    @sunburn_systems = SunburnSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sunburn_systems }
    end
  end

  # GET /sunburn_systems/1
  # GET /sunburn_systems/1.json
  def show
    @sunburn_system = SunburnSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sunburn_system }
    end
  end

  # GET /sunburn_systems/new
  # GET /sunburn_systems/new.json
  def new
    @sunburn_system = SunburnSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sunburn_system }
    end
  end

  # GET /sunburn_systems/1/edit
  def edit
    @sunburn_system = SunburnSystem.find(params[:id])
  end

  # POST /sunburn_systems
  # POST /sunburn_systems.json
  def create
    @sunburn_system = SunburnSystem.new(params[:sunburn_system])
    @sunburn_system.total = @sunburn_system.rate*3*1.1
    @sunburn_system.fee = @sunburn_system.rate*3*0.1
    @sunburn_system.feewopg = @sunburn_system.fee*0.75
    @sunburn_system.commission = @sunburn_system.feewopg*0.35
    respond_to do |format|
      if @sunburn_system.save
        format.html { redirect_to @sunburn_system, notice: 'Sunburn system was successfully created.' }
        format.json { render json: @sunburn_system, status: :created, location: @sunburn_system }
      else
        format.html { render action: "new" }
        format.json { render json: @sunburn_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sunburn_systems/1
  # PUT /sunburn_systems/1.json
  def update
    @sunburn_system = SunburnSystem.find(params[:id])

    respond_to do |format|
      if @sunburn_system.update_attributes(params[:sunburn_system])
        format.html { redirect_to @sunburn_system, notice: 'Sunburn system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sunburn_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sunburn_systems/1
  # DELETE /sunburn_systems/1.json
  def destroy
    @sunburn_system = SunburnSystem.find(params[:id])
    @sunburn_system.destroy

    respond_to do |format|
      format.html { redirect_to sunburn_systems_url }
      format.json { head :no_content }
    end
  end
end
