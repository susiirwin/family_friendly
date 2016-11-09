class ChangeFamilyRatingBackToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :reviews, :family_rating, :integer
  end
end
