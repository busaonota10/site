class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone

      t.timestamps null: false
    end

    add_index :users, :phone, unique: true
  end
end
