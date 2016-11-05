class RemoveZipCodeFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :zip_code
  end
end
