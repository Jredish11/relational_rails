class GrowRoomStrainsController < ApplicationController
  def index
    @grow_rooms = GrowRoom.includes(:strains)
  end
end