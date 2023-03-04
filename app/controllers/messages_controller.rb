class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.order(created_at: :desc).limit(10)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
