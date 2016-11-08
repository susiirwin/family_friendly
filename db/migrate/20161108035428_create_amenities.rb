class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.boolean "ladies_room_table", default: false
      t.boolean "mens_room_table", default: false
      t.boolean "kids_menu", default: false
      t.boolean "seats", default: false
      t.boolean "activites", default: false
      t.boolean "nursing_area", default: false
      t.boolean "slings", default: false
      t.boolean "stroller_storage", default: false
      t.boolean "play_area", default: false

      t.timestamps
    end
  end
end
