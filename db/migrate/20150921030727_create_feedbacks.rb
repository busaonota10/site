class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.string :latitude
      t.string :longitude
      t.string :opinion
      t.string :user
      t.datetime :sent_at
      t.belongs_to :bus, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :feedbacks, :opinion
    add_index :feedbacks, :user
  end
end
