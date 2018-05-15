class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.text :quote
      t.string :image
      t.string :video
      t.date :date
      t.integer :status
      t.integer :sticky_order
      t.integer :speaker_id

      t.timestamps
    end
  end
end
