module Rooms
  class MessagesController < ApplicationController
    include RoomCommonMethods

    before_action :set_message, only: [:destroy]
    before_action :authenticate_user!

    def index
      @messages = @room.messages.order("created_at DESC").page params[:page]
      gon.room_id = @room.id
      gon.last_page = true if @messages.last_page?
    end

    def create
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      @message.room_id = params[:room_id]

      if @message.save
        ActionCable.server.broadcast "room_#{@room.id}", 
          id:         @message.id,
          message:    @message.text,
          email:      @message.user.email,
          created_at: @message.created_at
        head :ok
        #redirect_to room_messages_path @room
      else
        #redirect_to room_messages_path @room, notice: "failed to send message"
      end
    end

    private
      def set_message
        @message = Message.find(id: params[:id])
      end

      def message_params
        params.require(:message).permit(:id, :text)
      end
  end
end