class DabbaDrivesController < ApplicationController
  def create
    @dabba_drive = DabbaDrive.new(params[:dabba_drive])
    if @dabba_drive.save
      redirect_to :back, :notice => "Thanks for registration. Dabbas are on the way."
    else
      redirect_to :back, :notice => "Couldn't register you at the moment please try again."
    end
  end
end
