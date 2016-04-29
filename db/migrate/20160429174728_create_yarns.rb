class CreateYarns < ActiveRecord::Migration
  def change
    create_table :yarns do |t|
      t.string :name, null: false
      t.decimal :measured_yardage, precision: 10, scale: 2, null: false
      t.integer :number_of_plies, null: false
      t.decimal :yardage_credit, precision: 10, scale: 2
      t.integer :user_id
      t.timestamps null: false
    end
    add_index :yarns, :user_id
  end
end
