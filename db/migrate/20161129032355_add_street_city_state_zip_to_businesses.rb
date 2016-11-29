class AddStreetCityStateZipToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :street, :string
    add_column :businesses, :city, :string
    add_column :businesses, :state, :string
    add_column :businesses, :zip_code, :string
  end
end
