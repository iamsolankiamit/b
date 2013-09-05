class CheckoutController < ApplicationController
  before_filter :authenticate_user!
  include ActiveMerchant::Billing::Integrations
  def booking
    @checkout = Checkout.new
    @checkout.set_values(params['offer_id'],params['checkin'],params['checkout'],params['guests'],current_user.id)
  end

  def new
  end

  def create
  end
  def payu_return
    notification = PayuIn.notification(request.query_string, options = {:credential1 => $payu_merchant_id, :credential2 => $payu_secret_key, :params => params})

    @checkout = Checkout.find(notification.invoice) # notification.invoice is order id/cart id which you have submited from payment direction page.

    if notification.acknowledge
      begin
        if notification.complete?
          @checkout.status = 'success'
          @checkout.booked_at = Time.now
          @trip = Trip.create(:checkout_id => @checkout.id, :total => notification.gross, :card_holder_name => params['name_on_card'], :transaction_number => notification.invoice)
          reset_session
          redirect_to @trip
        else
          @checkout.status = "failed"
          render :text =>"Order Failed! MD5 Hash does not match!"
        end
      ensure
        @checkout.save
      end
    end
  end
end
