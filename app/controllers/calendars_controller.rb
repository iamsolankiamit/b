class CalendarsController < ApplicationController

  def index
    @offer = current_user.offers.find(params[:offer_id])
    @calendar = Calendar.scoped
    @calendar = Calendar.between(params['start'], params['end']) if (params['start'] && params['end'])
    respond_to do |format|
      format.json { render :json => @calendar}
    end
  end

  def edit
    @offer = current_user.offers.find(params[:offer_id])
  end

  def show
    if (params['start'] && params['end'])
      @calendar = Calendar.between(params['start'], params['end'],params['offer_id'])
    end
    respond_to do |format|
      format.json { render :json => @calendar}
    end
  end

  def create
    start = params[:calendar][:start].to_date
    end_date = params[:calendar][:end].to_date

if params[:calendar][:price] == ""
    price = Offer.find(params[:offer_id]).select(:nightly_rate_amount)
  else
    price = params[:calendar][:price]
end
    start.upto(end_date) do |date|
      @calendar = Calendar.update_or_create_by_date(date,params[:calendar][:availability],price.to_f,params[:offer_id]) do |c|
        c.pricing = params[:calendar][:price]
        c.availability = params[:calendar][:availability]
      end
    end
    respond_to { |format| format.json {render  json: true} }
  end
end
