require 'rails_helper'

RSpec.describe "/grow_rooms/:id", type: :feature do
  describe "as a visitor, when I visit grow_rooms/:id" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)}
    let!(:room_2) { GrowRoom.create!(name: "Flower Room 2", is_flower: true, plant_capacity: 185)}
 
    # #User Story 12
    it "displays a link to update the grow_room 'Update Grow Room'" do
      visit "/grow_rooms/#{room_1.id}"
      save_and_open_page
      expect(page).to have_link("Update Grow Room", href: "/grow_rooms/#{room_1.id}/edit")

      click_link "Update Grow Room"

      expect(current_path).to eq("/grow_rooms/#{room_1.id}/edit")

      fill_in(:name, with: "Flower Room 3")
      check(:is_flower)
      fill_in(:plant_capacity, with: 53)
      click_on("Update Grow Room")

      expect(current_path).to eq("/grow_rooms/#{room_1.id}")
      expect(page).to have_content(53)
      expect(page).to_not have_content(176)
    end
  end
end