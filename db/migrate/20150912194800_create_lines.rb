class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :number
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :lines, :number, unique: true
  end
end
