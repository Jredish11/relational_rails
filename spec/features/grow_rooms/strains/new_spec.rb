require 'rails_helper'

RSpec.describe "/grow_rooms/:grow_room_id/strains", type: :feature do
    
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

    #User Story 13
    xit "displays a link to add a new strain for that grow_room, clicks link, taken to form for new strain, click button, redirected to grow_room strains index page" do
        visit "/grow_rooms/#{room_1.id}/strains_by_grow_room"

        expect(page).to have_link("Create Strain")

        click_link("Create Strain")

        expect(current_path).to eq("/grow_rooms/#{room_1.id}/strains/new")

        fill_in(:name, with: "Runtz")
        check(:is_sativa)
        fill_in(:thc_percentage, with: 22.02)
        fill_in(:dry_weight, with: 1599.33)
        click_on("Create Strain")

        expect(current_path).to eq("/grow_rooms/#{room_1.id}/strains")
        expect(page).to have_content("Runtz")
        expect(page).to_not have_content("GMO")
        expect(page).to have_content("Gary Payton")
    end
end