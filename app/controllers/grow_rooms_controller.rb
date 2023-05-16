class GrowRoomsController < ApplicationController
  def index
    @grow_rooms = GrowRoom.order(created_at: :desc)
  end

  def show
    @grow_room = GrowRoom.find(params[:id])
    @strain_count = @grow_room.strains.count
  end

  def new
  
  end

  def edit
    @grow_room = GrowRoom.find(params[:id])
  end

  def update
    @grow_room = GrowRoom.find(params[:id])
    @grow_room.update(name: params[:name],
                    is_flower: params[:is_flower],
                    plant_capacity: params[:plant_capacity])
    redirect_to "/grow_rooms/#{@grow_room.id}"
  end

  def create
    GrowRoom.create!(name: params[:name],
                    is_flower: params[:is_flower],
                    plant_capacity: params[:plant_capacity])
    redirect_to "/grow_rooms"
  end

 

end