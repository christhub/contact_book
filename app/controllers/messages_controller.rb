class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    @contact = Contact.find(params[:contact]) if params[:contact]
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @message = Message.new(message_params)
    @message.from = our_number

    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      flash[:alert] = "Try again..."
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
