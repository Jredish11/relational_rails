class CreateStrains < ActiveRecord::Migration[7.0]
  def change
    create_table :strains do |t|
      t.string :name
      t.boolean :is_sativa
      t.float :thc_percentage
      t.float :dry_weight
      t.references :grow_room, foreign_key: true

      t.timestamps
    end
  end
end
