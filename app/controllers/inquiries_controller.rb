class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @inquiry.messages.build
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save!
    else
    end
  end

  def index
    @inquiries = Inquiry.find_by_receiver_id(current_user.id)
  end

  def delete
  end
end
