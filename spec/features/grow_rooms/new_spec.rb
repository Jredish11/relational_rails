require 'rails_helper'

RSpec.describe "/grow_rooms/new", type: :feature do
  describe "as a visitor, when I visit grow_rooms index page" do
    let!(:room_1) { GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176) }
    let!(:room_2) { GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185)}
    

    #User Story 11
    it "displays a link to create a new Grow_room record, 'New Grow_room'" do
    visit grow_rooms_path
    

    expect(page).to have_link("New Grow Room", href: new_grow_room_path)

    click_link "New Grow Room"

    expect(current_path).to eq(new_grow_room_path)

    fill_in :name, with: "Flower Room 2"
    check :is_flower
    fill_in :plant_capacity, with: 100
    click_on "Create Grow Room"

    expect(current_path).to eq(grow_rooms_path)
    expect(page).to have_content("Flower Room 2")
    end


  end
end