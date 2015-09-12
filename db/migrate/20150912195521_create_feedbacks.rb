class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.string :latitude
      t.string :longitude
      t.string :opinion
      t.datetime :sent_at
      t.belongs_to :bus, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
