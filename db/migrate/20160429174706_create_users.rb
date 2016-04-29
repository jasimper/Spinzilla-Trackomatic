class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.decimal :total_yardage, precision: 10, scale: 2
      t.timestamps null: false
    end
  end
end
