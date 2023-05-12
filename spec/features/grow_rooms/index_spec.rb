require 'rails_helper'

RSpec.describe "/grow_rooms", type: :feature do
  #User Story 1
  describe "as a visitor, when I visit grow_rooms index page" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)}
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185)}

    it "I see the name of each grow_room" do
      visit "/grow_rooms"
  # save_and_open_page
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_2.name) 

    end
  end
end