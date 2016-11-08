class CreateBusinessAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :business_amenities do |t|
      t.references :amenity, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
