require 'rails_helper'

RSpec.describe "/grow_rooms", type: :feature do
  #User Story 1
  describe "as a visitor, when I visit grow_rooms index page" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176, created_at: Date.today - 1.day)}
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185, created_at: Date.today)}

    it "I see the name of each grow_room" do
      visit "/grow_rooms"
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_2.name) 
    end

    #User Story 6
    it "I see the records are ordered by most recently created first and next to each of the records I see when it was created" do
      visit "/grow_rooms"
      save_and_open_page
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_2.name)
      expect(page).to have_content(room_1.created_at)
      expect(page).to have_content(room_2.created_at)



    end
  end
end

  
    