class CreateWebinars < ActiveRecord::Migration[5.1]
  def change
    create_table :webinars do |t|
      t.string :title
      t.text :content
      t.date :date
      t.string :video
      t.string :image
      t.string :link
      t.string :speaker_id
      t.string :slug

      t.timestamps
    end
  end
end
