class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :yelp_id
      t.string :address
      t.string :phone
      t.decimal :star_rating

      t.timestamps null: false
    end
  end
end
