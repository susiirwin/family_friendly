class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true
      t.text :comments
      t.boolean "ladies_room_table", default: false
      t.boolean "mens_room_table", default: false
      t.boolean "kids_menu", default: false
      t.boolean "seats", default: false
      t.boolean "activites", default: false
      t.boolean "nursing_area", default: false
      t.boolean "slings", default: false
      t.boolean "stroller_storage", default: false
      t.boolean "play_area", default: false
      t.boolean "zero_one", default: false
      t.boolean "one_two", default: false
      t.boolean "two_three", default: false
      t.boolean "three_four", default: false
      t.boolean "five_and_up", default: false
      t.decimal "family_rating", null: false

      t.timestamps
    end
  end
end
