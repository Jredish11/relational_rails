require 'rails_helper'

RSpec.describe "/grow_rooms/:id", type: :feature do
  describe "as a visitor, when I visit grow_rooms/:id" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)}
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185)}
    let!(:flo) { room_1.strains.create!(name: "Flo OG", 
      is_sativa: true, 
      thc_percentage: 23.04, 
      dry_weight: 1500.23,
      )}
      let!(:gary_payton) { room_1.strains.create!(name: "Gary Payton",
        is_sativa: false,
        thc_percentage: 29.69,
        dry_weight: 1323.43,
        )}
        let!(:gg4) { room_2.strains.create!(name: "Gorilla Glue #4",
          is_sativa: false,
          thc_percentage: 29.69,
          dry_weight: 1323.43,
          )}
          
          
          
    #User Story 2
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

    #User Story 7
    it "displays count of the number of strains associated with this grow_room" do
      visit "/grow_rooms/#{room_1.id}"
      expect(page).to have_content("Number of Strains: 2")

      visit "/grow_rooms/#{room_2.id}"
      expect(page).to have_content("Number of Strains: 1")
    end

    #User Story 10
    it "display a link to take me to the current grow room's strains page /grow_rooms/:id/strains" do
      visit "/grow_rooms/#{room_1.id}"
      expect(page).to have_link("Grow Rooms Strain's", href: "/grow_rooms/#{room_1.id}/strains")
      visit "/grow_rooms/#{room_2.id}"
      save_and_open_page
      expect(page).to have_link("Grow Rooms Strain's", href: "/grow_rooms/#{room_2.id}/strains")
    end
  end
end