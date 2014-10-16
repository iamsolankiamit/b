class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @inquiry.messages.build
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @offer = Offer.find(@inquiry.offer_id)
    @messages = @inquiry.messages.all.sort_by(&:created_at).reverse
    if @inquiry.guest_id
      @guest = User.find(@inquiry.guest_id)
      @host = User.find(@inquiry.host_id)
    else
      @guest =User.find(@inquiry.messages.first.sender_id)
      @host =User.find(@inquiry.messages.first.receiver_id)
    end
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    @inquiry.guest_id = @inquiry.messages.first.sender_id
    @inquiry.host_id = @inquiry.messages.first.receiver_id
    if @inquiry.save!
      InquiryMailer.new_inquiry(@inquiry, @inquiry.messages.first.receiver_id).deliver
      redirect_to @inquiry
    else
      redirect_to :back
    end
  end

  def index
    @inquiries = Inquiry.where('guest_id = ? OR host_id = ?', current_user.id , current_user.id).includes(:messages,:host,:guest)
  end

  def delete
  end
end
