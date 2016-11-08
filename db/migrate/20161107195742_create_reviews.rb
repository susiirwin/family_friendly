class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true
      t.text :comments
      t.decimal "family_rating", null: false

      t.timestamps
    end
  end
end
