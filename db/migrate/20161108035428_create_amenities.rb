class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.text "amenity_name"
      t.boolean "available", default: false

      t.timestamps
    end
  end
end
