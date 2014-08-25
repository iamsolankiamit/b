class RegistrationsController < Devise::RegistrationsController

 after_filter :set_referrals, only: :create

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(params[:user])
                           else
                             # remove the virtual current_password attribute update_without_password
                             # doesn't know how to ignore it
                             params[:user].delete(:current_password) if params[:user][:current_password]
                             @user.update_without_password(params[:user])
                           end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

 # POST /resource
  def create
    if params[:referer_id]
      sign_up_params
    end
    build_resource(sign_up_params.delete_if {|key, value| key == "referer_id"})


    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end


  def change_password
    @user = User.find(current_user.id)
    @user.update_with_password(params[:user])
  end

  private

  def set_referrals
    if session[:referer_id]
      referer = User.find(session[:referer_id])
      if referer
        referral = Referral.new()
        referral.referer_id = referer.id
        referral.referee_id = resource.id
        referral.save! rescue render :text => sign_up_params
      end
    end
  end

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    if params[:user][:email] || params[:user][:password]
      user.email != params[:user][:email] || !params[:user][:password].blank?
    end
  end
end
