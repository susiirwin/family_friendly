class CreateFamilies < ActiveRecord::Migration[5.0]
  def change
    create_table :families do |t|
      t.integer :total_family
      t.integer :age_0_1
      t.integer :age_1_2
      t.integer :age_2_3
      t.integer :age_3_4
      t.integer :age_4_5

      t.timestamps
    end
  end
end
