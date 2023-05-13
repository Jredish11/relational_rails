class StrainsController < ApplicationController
  def index
    @strains = Strain.all
  end

  def show
    @strain = Strain.find(params[:id])
  end

  def strains_by_grow_room
   @grow_rooms = GrowRoom.all.includes(:strains)
  end
end