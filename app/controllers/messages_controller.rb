class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:store)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      MessageChannel.broadcast_to @room, { message: @message, store: @message.store }
    else
      @messages = @room.messages.includes(:store)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:business_id, :ingredients, :quantity, :comment).merge(store_id: current_store.id)
  end
end
