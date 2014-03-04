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
    @inquiry = Inquiry.find(@message.inquiry_id)
    @host = User.find(@inquiry.host_id)
    @guest = User.find(@inquiry.guest_id)
    phone_regex = /[789]\d{9}/
    email_regex = /[a-z\d\.\_\%\+\-]+(\[at\]|@|\[at\ the\ rate\])+[a-z\d\.\-]+(\[\.\]|\.|\[dot\])+[a-z]{2,4}/i #email[at]gmail[.]com
    website_regex = /(?i)\b((?:[a-z][\w-]+:(?:\/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>]))/
    if !phone_regex.match(@message.content) && !email_regex.match(@message.content) && !website_regex.match(@message.content)
      respond_to do |format|
        if @message.save!
          flash[:notice] = "Message has been sent"
          format.json {render json: flash }
          format.js {
            @content = render_to_string(:partial => 'message')
          }
        else
          render :action => :new
        end
      end
    else
      @message.content.gsub!(email_regex, " { Email Hidden} ")
      @message.content.gsub!(phone_regex, " { Phone Hidden} ")
      @message.content.gsub!(website_regex, " { website Hidden} ")
      respond_to do |format|
        if @message.save!
          flash[:notice] = "Message has been sent"
          format.json {render json: flash }
          format.js {
            @content = render_to_string(:partial => 'message')
          }
        else
          render :action => :new
        end
        flash[:notice] = "#{@message.content}Email Id's, Phone Number and Address are not allowed"
      end
    end
  end
end

