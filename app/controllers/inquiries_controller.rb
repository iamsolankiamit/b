class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @inquiry.messages.build
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @offer = Offer.find(@inquiry.offer_id)
    @messages = @inquiry.messages.all.sort_by(&:created_at).reverse
    @guest = User.find(@inquiry.guest_id)
    @host = User.find(@inquiry.host_id)
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
    @inquiries = Inquiry.where('guest_id = ? OR host_id = ?', current_user.id , current_user.id)
  end

  def delete
  end
end
