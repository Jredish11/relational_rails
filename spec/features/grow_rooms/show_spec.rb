require 'rails_helper'

RSpec.describe "/grow_rooms/:id", type: :feature do
  #User Story 2
  describe "as a visitor, vhen I visit grow_rooms/:id" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)}
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185)}

    it "I see the grow_rooms with that id including the grow_rooms attributes" do
      visit "/grow_rooms/#{room_1.id}"
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_1.is_flower)
      expect(page).to have_content(room_1.plant_capacity)
      
      visit "/grow_rooms/#{room_2.id}"
      expect(page).to have_content(room_2.name)
      expect(page).to have_content(room_2.is_flower)
      expect(page).to have_content(room_2.plant_capacity)
    end
  end
end