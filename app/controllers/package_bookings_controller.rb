class PackageBookingsController < ApplicationController
  # GET /package_bookings
  # GET /package_bookings.json
  def index
    @package_bookings = PackageBooking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @package_bookings }
    end
  end

  # GET /package_bookings/1
  # GET /package_bookings/1.json
  def show
    @package_booking = PackageBooking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @package_booking }
    end
  end

  # GET /package_bookings/new
  # GET /package_bookings/new.json
  def new
    @package_booking = PackageBooking.new
    @package_id = params[:package_booking][:package_id]
    @guest_count = params[:package_booking][:guest_count]
    @unit_count = params[:package_booking][:unit_count]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @package_booking }
    end
  end

  # GET /package_bookings/1/edit
  def edit
    @package_booking = PackageBooking.find(params[:id])
    @package = Package.find(@package_booking.package_id)
  end

  # POST /package_bookings
  # POST /package_bookings.json
  def create
    @package_booking = PackageBooking.new(params[:package_booking])
    @package = Package.find(params[:package_booking][:package_id])
    if @package.unit_count < @package_booking.unit_count.to_i
      redirect_to :back
    else
      if (@package_booking.guest_count > @package.max_guest)
        redirect_to :back
      else
        if @package_booking.guest_count <= @package.pax_count
          @package_booking.total = (@package.price)*@package_booking.unit_count.to_i*3*1.11236
        else
          @extra_guest_charge =  @package.extra_person_charge*(@package_booking.guest_count - @package.pax_count )
          @package_booking.total = (@package.price + @extra_guest_charge)*@package_booking.unit_count.to_i*3*1.11236
        end
        respond_to do |format|
          if @package_booking.save
            format.js { @content = render_to_string(:partial => 'payment').gsub("\"","'").gsub("\n","\\")}
            format.html { redirect_to edit_package_booking_path(@package_booking) }
            format.json { render json: @package_booking, status: :created, location: @package_booking }
          else
            format.html { render action: "new" }
            format.json { render json: @package_booking.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PUT /package_bookings/1
  # PUT /package_bookings/1.json
  def update
    @package_booking = PackageBooking.find(params[:id])

    respond_to do |format|
      if @package_booking.update_attributes(params[:package_booking])
        format.html { redirect_to @package_booking, notice: 'Package booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @package_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_bookings/1
  # DELETE /package_bookings/1.json
  def destroy
    @package_booking = PackageBooking.find(params[:id])
    @package_booking.destroy

    respond_to do |format|
      format.html { redirect_to package_bookings_url }
      format.json { head :no_content }
    end
  end

  def payu_return
    notification = PayuIn.notification(request.query_string, options = {:credential1 => $payu_merchant_id, :credential2 => $payu_secret_key, :params => params})
    @booking = PackageBooking.find(notification.invoice.to_i) # notification.invoice is order id/cart id which you have submited from payment direction page.
    @package = Package.find(@booking.package_id)
    @package.unit_count -= @booking.unit_count
    if notification.acknowledge
      begin
        if notification.complete?
          @booking.status = 'success'
          @booking.booked_at = Time.now
          @booking.card_holder_name = params['name_on_card']
          @booking.transaction_number = notification.invoice
          redirect_to @booking
        else
          @booking.status = "failed"
          render :text =>"Order Failed! MD5 Hash does not match!"
        end
      ensure
        @booking.save
      end
    end
  end
end
