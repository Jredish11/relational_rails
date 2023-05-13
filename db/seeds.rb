room_1 = GrowRoom.create!(name: "Flower Room 1", is_flower: true, plant_capacity: 176)
room_2 = GrowRoom.create!(name: "Veg Room 1", is_flower: false, plant_capacity: 185)

flo = room_1.strains.create!(name: "Flo OG", 
                            is_sativa: true, 
                            thc_percentage: 23.04, 
                            dry_weight: 1500.23,
                            )
gary_payton = room_1.strains.create!(name: "Gary Payton",
    is_sativa: false,
    thc_percentage: 29.69,
    dry_weight: 1323.43,
    )
gg4 = room_2.strains.create!(name: "Gorilla Glue #4",
                            is_sativa: false,
                            thc_percentage: 29.69,
                            dry_weight: 1323.43,
                            )
      