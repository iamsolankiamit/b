class PackagesController < ApplicationController
  # GET /packages
  # GET /packages.json
  def index
    @package1 = Package.find(3)
    @package1offer = Offer.find("wx1k7g")
    @package2 = Package.find(4)
    @package2offer = Offer.find("pwpjzg")
    @package3 = Package.find(5)
    @package3offer = Offer.find("nt7ggg")
    @package4 = Package.find(6)
    @package4offer = Offer.find("p7mfvg")
    @package5 = Package.find(7)
    @package5offer = Offer.find("8h58ag")
    @package6 = Package.find(8)
    @package6offer = Offer.find("mct5zg")
    @package7 = Package.find(9)
    @package7offer = Offer.find("qybczg")
    @package8 = Package.find(10)
    @package8offer = Offer.find("47r5qg")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages }
    end
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package = Package.find(params[:id])
     offer_id = "sq19j7"
    case params[:id] when "3"
     offer_id = "wx1k7g"
    when "4"
    offer_id="pwpjzg"
    when "5"
    offer_id = "nt7ggg"
    when "6"
    offer_id = "p7mfvg"
    when "7"
    offer_id = "8h58ag"
    when "8"
    offer_id = "mct5zg"
    when "9"
    offer_id = "qybczg"
    when "10"
    offer_id = "47r5qg"
    when "11"
    offer_id = "fs31fg"
    when "12"
    offer_id = "1a4q5g"
    when "13"
    offer_id = "9j0rng"
    when "14"
    offer_id = "c1knfg"
    when "15"
    offer_id = "yx6mhg"
    when "16"
    offer_id = "9fqnyg"
    when "17"
    offer_id = "s1w23g"
    when "18"
    offer_id = "j2ycqg"
    when "19"
    offer_id = "dfjhkg"
    when "20"
    offer_id = "nwet9g"
    end
    @offer = Offer.find(offer_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @package }
    end
  end

  # GET /packages/new
  # GET /packages/new.json
  def new
    @package = Package.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @package }
    end
  end

  # GET /packages/1/edit
  def edit
    @package = Package.find(params[:id])
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(params[:package])

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render json: @package, status: :created, location: @package }
      else
        format.html { render action: "new" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packages/1
  # PUT /packages/1.json
  def update
    @package = Package.find(params[:id])

    respond_to do |format|
      if @package.update_attributes(params[:package])
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    respond_to do |format|
      format.html { redirect_to packages_url }
      format.json { head :no_content }
    end
  end
end
