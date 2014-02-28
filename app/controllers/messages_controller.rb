class MessagesController < ApplicationController
  def index
  end

  def inbox
    @messages=Message.where(reciever_id: current_user.id)
  end

  def sent
    @messages=Message.where(sender_id: current_user.id)
  end

  def show
    @message = Message.find(params[:id])
  end

  def delete
    @message.destroy
    redirect_to message_url
  end

  def new
    @message = Message.new
    if (session[:reciever_id])
      @message.reciever_id = session[:reciever_id]
    end
  end

  def create
    @message = Message.new(params[:message])
    phone_regex = /[789]\d{9}/
    email_regex = /[a-z\d\.\_\%\+\-]+(\[at\]|@)+[a-z\d\.\-]+(\[\.\]|\.)+[a-z]{2,4}/ #email[at]gmail[.]com
    @u = User.find(@message.sender_id)
    if !phone_regex.match(@message.content) && !email_regex.match(@message.content) && @message.receiver_id.to_i != 0

      respond_to do |format|
        if @message.save
          flash[:notice] = "Message has been sent"
          format.json {render json: flash }
        else
          render :action => :new
        end
      end
    else
      flash[:notice] = "Email Id's, Phone Number and Address are not allowed"
      render :action => :new
    end
  end

end
