class AddUserRefToFamily < ActiveRecord::Migration[5.0]
  def change
    add_reference :families, :user, foreign_key: true
  end
end
