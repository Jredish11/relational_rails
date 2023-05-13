class GrowRoomsController < ApplicationController
  def index
    @grow_rooms = GrowRoom.order(created_at: :desc)
  end

  def show
    @grow_room = GrowRoom.find(params[:id])
  end
end