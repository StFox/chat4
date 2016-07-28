module RoomCommonMethods
  extend ActiveSupport::Concern

  included do
  	before_action :load_room, :check_access
  end

  def load_room
  	@room = Room.find(params[:room_id])
	end

  def check_access
    unless @room.users.exists?(current_user.id)
      raise CanCan::AccessDenied
    end
  end

end