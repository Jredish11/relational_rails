require 'rails_helper'

RSpec.describe "/strains/:id", type: :feature do
  #User story 4
  describe "as a visitor, when I visit /strains/:id" do
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

    it "should see the strain with that id and their attributes" do
      visit "/strains/#{flo.id}"
      save_and_open_page
      expect(page).to have_content(flo.name)
      expect(page).to have_content(flo.is_sativa)
      expect(page).to have_content(flo.thc_percentage)
      expect(page).to have_content(flo.dry_weight)

      visit "/strains/#{gary_payton.id}"
      expect(page).to have_content(gary_payton.name)
      expect(page).to have_content(gary_payton.is_sativa)
      expect(page).to have_content(gary_payton.thc_percentage)
      expect(page).to have_content(gary_payton.dry_weight)


    end
  end
end