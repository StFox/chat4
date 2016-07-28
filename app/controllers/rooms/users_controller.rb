module Rooms
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    include RoomCommonMethods

    def index
      @users = @room.users
    end

    def new
    end

    def create
      @user = User.find_by(email: user_params[:email])
      if @user.nil?
         redirect_to room_users_path @room, notice: "users not found"
         return
      end
      @room.users << @user
      if @room.save 
        redirect_to room_users_path @room, notice: "users added"
      else
        redirect_to room_users_path @room, notice: "users not added"
      end
    end

    def destroy
      @room.users.delete(User.find(params[:id]))
      redirect_to room_users_path
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:id, :email)
      end
  end
end