class GrowRoomsController < ApplicationController
  def index
    @grow_rooms = GrowRoom.all
  end
end