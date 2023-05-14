require 'rails_helper'

RSpec.describe "/grow_rooms", type: :feature do
  describe "as a visitor, when I visit grow_rooms index page" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176, created_at: Date.today - 1.day)}
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185, created_at: Date.today)}
    
    #User Story 1
    it "I see the name of each grow_room" do
      visit "/grow_rooms"
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_2.name) 
    end

    #User Story 6
    it "I see the records are ordered by most recently created first and next to each of the records I see when it was created" do
      visit "/grow_rooms"
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(room_2.name)
      expect(page).to have_content(room_1.created_at)
      expect(page).to have_content(room_2.created_at)
    end
  end

  describe "as a visitor, when I visit any page on the site" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)}
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
    #User Story 9
    it "show a link at top of the page that takes visitor to the Grow_Rooms index page" do
      visit "/"
      # save_and_open_page
      expect(page).to have_link("Grow Rooms Index", href: "/grow_rooms")
    end
  end
end

  
    