class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new
    @room.users << current_user
    if @room.save
      redirect_to rooms_path, notice: 'Room was successfully created.' 
    else
      render :new, notice: "error"
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:id)
    end
end
