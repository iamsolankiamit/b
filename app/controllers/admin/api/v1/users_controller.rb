class Admin::Api::V1::UsersController < ApplicationController

  respond_to :json

def index
  respond_with User.where("guest_account is ?", nil)
end

end
