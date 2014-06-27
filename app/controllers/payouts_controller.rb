class PayoutsController < ApplicationController
  def index
    @payouts = Payout.where(guest_id: current_user.id).includes(:booking,:trip).all
  end
end
