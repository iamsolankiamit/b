class WizardStepsController < ApplicationController

  STEPS = ['address', 'image', 'user']

  def edit
    @offer= Offer.find(params[:offer_id])
    @photos = Photo.where(:offer_id =>@offer.id).all
    if @offer.user_id == current_or_guest_user.id
      if step.present?
        if current_user && step == 'user'
          redirect_to edit_offer_translations_path(@offer)
        else
        render step
        end
      else
        raise ActionController::RoutingError.new('Not Found')
      end
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def update
    @offer = Offer.find(params[:offer_id])
    if wizard_step_offer.update_attributes(params[:offer])
      if next_step && params[:commit].downcase.include?('continue')
        redirect_to edit_offer_wizard_step_path(wizard_step_offer, next_step)
      else
        redirect_to offer_path(@offer)
      end
    else
      render step, :error => "Please complete all the fields"
    end
  end

  private

  def authorize_offer
    @offer = wizard_step_offer
    if @offer.user_id != current_user.id
      raise ActionController::RoutingError.new('Forbidden')
    end
  end



  def wizard_step_offer
    offer_class = "Offer::#{step.camelcase}".constantize
    offer_class.find(params[:offer_id])
  end





  def step
    STEPS.find {|a_step| a_step == params[:id].to_s.downcase}
  end

  def next_step
    current_step_index = STEPS.index(step)
    next_step = STEPS[current_step_index + 1]
  end
end
