class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @inquiry.messages.build
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @offer = Offer.find(@inquiry.offer_id)
    @messages = @inquiry.messages.all
    @guest = User.find(@messages.first.sender_id)
    @host = User.find(@messages.first.receiver_id)
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save!
      redirect_to @inquiry
    else
      redirect_to :back
    end
  end

  def index
    @inquiries = Inquiry.find_by_receiver_id(current_user.id)
  end

  def delete
  end
end
