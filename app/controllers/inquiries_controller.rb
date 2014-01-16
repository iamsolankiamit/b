class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiries])
  end

  def index
    @inquiries = Inquiry.find_by_receiver_id(current_user.id)
  end

  def delete
  end
end
