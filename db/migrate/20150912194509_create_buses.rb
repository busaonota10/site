class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :identification_number
      t.string :line
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :buses, :identification_number, unique: true
    add_index :buses, :line, unique: true
  end
end
