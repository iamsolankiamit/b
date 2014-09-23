class SearchController < ApplicationController
  require 'booking_dot_com'
  def index
    @offers ||= find_offers.page params[:page]
    @price_min = Offer.near(params[:destination], 50).minimum(:nightly_rate_amount)
    @price_max = Offer.near(params[:destination], 50).maximum(:nightly_rate_amount)
    @offers = find_amenities if params[:amenities]
    cookies[:checkin] = params[:checkin] unless params[:checkin].nil?
    cookies[:checkout] = params[:checkout] unless params[:checkout].nil?
    cookies[:price_minimum] = params[:price_min] unless params[:price_min].nil?
    cookies[:price_maximum] = params[:price_max] unless params[:price_max].nil?
    if @offers.empty?
      # redirect_to BookingDotCom.url_creator(params[:destination],params[:checkin],params[:checkout],params[:guests])
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    if params[:search][:destination]
      destination = params[:search][:destination].gsub(/, /,'-').gsub(/ /,'-')
      price_min = params[:search][:price_min].to_i
      price_max = params[:search][:price_max].to_i
      if params[:search][:amenities]
        if params[:aid]
        redirect_to search_path(destination,guests: params[:search][:guests],checkin: params[:search][:checkin], checkout: params[:search][:checkout], bedrooms: params[:search][:bedrooms], price_min: params[:search][:price_min] , price_max: params[:search][:price_max] , bed_count: params[:search][:bed_count] , bed_type: params[:search][:bed_type] , max_guest_count: params[:search][:max_guest_count] , amenities: { breakfast: params[:search][:amenities][:breakfast] ,air_conditioning: params[:search][:amenities][:air_conditioning] , smoking_allowed: params[:search][:amenities][:smoking_allowed], cable_tv: params[:search][:amenities][:cable_tv] , internet: params[:search][:amenities][:internet] , kitchen: params[:search][:amenities][:kitchen]  }, sort_by: params[:search][:sort_by], aid: params[:search][:aid])
        else
        redirect_to search_path(destination,guests: params[:search][:guests],checkin: params[:search][:checkin], checkout: params[:search][:checkout], bedrooms: params[:search][:bedrooms], price_min: params[:search][:price_min] , price_max: params[:search][:price_max] , bed_count: params[:search][:bed_count] , bed_type: params[:search][:bed_type] , max_guest_count: params[:search][:max_guest_count] , amenities: { breakfast: params[:search][:amenities][:breakfast] ,air_conditioning: params[:search][:amenities][:air_conditioning] , smoking_allowed: params[:search][:amenities][:smoking_allowed], cable_tv: params[:search][:amenities][:cable_tv] , internet: params[:search][:amenities][:internet] , kitchen: params[:search][:amenities][:kitchen]  }, sort_by: params[:search][:sort_by])
        end
      else
        if params[:aid]
        redirect_to search_path(destination,guests: params[:search][:guests],checkin: params[:search][:checkin], checkout: params[:search][:checkout], bedrooms: params[:search][:bedrooms], price_min: params[:search][:price_min] , price_max: params[:search][:price_max] , bed_count: params[:search][:bed_count] , bed_type: params[:search][:bed_type] , max_guest_count: params[:search][:max_guest_count], sort_by: params[:search][:sort_by], aid: params[:search][:aid] )
        else
        redirect_to search_path(destination,guests: params[:search][:guests],checkin: params[:search][:checkin], checkout: params[:search][:checkout], bedrooms: params[:search][:bedrooms], price_min: params[:search][:price_min] , price_max: params[:search][:price_max] , bed_count: params[:search][:bed_count] , bed_type: params[:search][:bed_type] , max_guest_count: params[:search][:max_guest_count], sort_by: params[:search][:sort_by] )
        end
      end
    else
      redirect_to :root, :notice => "Please enter destination."
    end
  end

  private

  def find_offers
    Offer.near(params[:destination], 50).where(conditions).sorting(params[:sort_by])
  end

  def find_amenities
    @offers = @offers.joins(:amenity).where(amenities_condition)
    ActiveRecord::Associations::Preloader.new(@offers, :amenity).run
    @offers
  end

  def conditions
    [conditions_clauses.join('AND') , *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end

  def conditions_options
    conditions_parts.map{ |condition| condition[-1..1] }.flatten
  end

  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end

  def min_price_conditions
    [' nightly_rate_amount >= ? ',params[:price_min]] if params[:price_min]  && params[:price_min] != 0 
  end

  def max_price_conditions
    [' nightly_rate_amount <= ? ',params[:price_max]] if params[:price_max]  && params[:price_max] != 0 
  end

  def is_verified_conditions
    [' is_verified = ?', true]
  end

  def bedcount_conditions
    [' bed_count >= ?',params[:bed_count]] if params[:bed_count]  && (params[:bed_count] != '' && params[:bed_count] != '0')
  end

  def max_guest_conditions
    [' max_guest_count >= ?' ,params[:max_guest_count]] if params[:max_guest_count] && (params[:max_guest_count] != '' && params[:max_guest_count] != '0')
  end

  def bedtype_conditions
    [' bed_type LIKE ?' ,params[:bed_type]] if params[:bed_type]  && params[:bed_type] != ''
  end

  def amenities_condition
    functions = private_methods(false).grep(/_amenity_condition$/).map { |m| send(m) }.compact
    conditions_parts_amen = functions
    x=conditions_parts_amen.map { |condition| condition.first }
    y=functions.map{ |condition| condition[-1..1] }.flatten
    [x.join('AND'),*y]
  end

  def breakfast_amenity_condition
    [' amenities.breakfast = ? ', true ] if (params[:amenities][:breakfast] == "1")  
  end

  def air_conditioning_amenity_condition
    [' amenities.air_conditioning = ? ', true ] if (params[:amenities][:air_conditioning] == "1")  
  end

  def smoking_allowed_amenity_condition
    [' amenities.smoking_allowed = ? ', true ] if (params[:amenities][:smoking_allowed] == "1")  
  end

  def cable_tv_amenity_condition
    [' amenities.cable_tv = ? ', true ] if (params[:amenities][:cable_tv] == "1")  
  end

  def internet_amenity_condition
    [' amenities.internet = ? ', true ] if (params[:amenities][:internet] == "1")  
  end

  def kitchen_amenity_condition
    [' amenities.kitchen = ? ', true ] if (params[:amenities][:kitchen] == "1")  
  end

end
