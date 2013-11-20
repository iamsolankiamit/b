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
    start = params['start'].to_date
    end_date = params['end'].to_date
    start.upto(end_date) do |date|
      @calendar = Calendar.update_or_create_by_date(date,true,params['pricing'].to_f,params['offer_id']) do |c|
        c.pricing = params['pricing']
      end
    end
    render :json => @calendar 
  end
end
