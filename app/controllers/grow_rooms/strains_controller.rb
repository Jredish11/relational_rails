class GrowRooms::StrainsController < ApplicationController
  def strains_by_grow_room
    @grow_rooms = GrowRoom.all
  end
end