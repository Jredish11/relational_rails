require 'rails_helper'

RSpec.describe "/strains", type: :feature do
  describe "as a visitor, when I visit flavors index page" do
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
        
    #User story 3
    it "should sees each strain in the system and their attributes" do
      visit "/strains"
      expect(page).to have_content(flo.name)
      expect(page).to have_content(flo.is_sativa)
      expect(page).to have_content(flo.thc_percentage)
      expect(page).to have_content(flo.dry_weight)

      expect(page).to have_content(gary_payton.name)
      expect(page).to have_content(gary_payton.is_sativa)
      expect(page).to have_content(gary_payton.thc_percentage)
      expect(page).to have_content(gary_payton.dry_weight)

    end
  end

  #User Story 5
  describe "as a visitor, when I visit grow_rooms strain index page" do
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
                  

    it "I see each Strain that is associated with that Grow_Room with each Strain's attributes" do
      visit "/grow_rooms/#{room_1.id}/strains"
      # save_and_open_page
      expect(page).to have_content(room_1.name)
      expect(page).to have_content(flo.name)
      expect(page).to have_content(flo.is_sativa)
      expect(page).to have_content(flo.thc_percentage)
      expect(page).to have_content(flo.dry_weight)
      expect(page).to have_content(gary_payton.name)
      expect(page).to have_content(gary_payton.is_sativa)
      expect(page).to have_content(gary_payton.thc_percentage)
      expect(page).to have_content(gary_payton.dry_weight)
    end
  end
end