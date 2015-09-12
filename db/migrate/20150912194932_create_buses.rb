class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :identification_number
      t.belongs_to :line, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :buses, :identification_number
  end
end
