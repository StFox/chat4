module RoomCommonMethods
  extend ActiveSupport::Concern

  included do
  	before_action :load_room
  end

  def load_room
  	@room = Room.find(params[:room_id])
	end
end