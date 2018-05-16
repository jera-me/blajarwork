class AddImageToSpeakers < ActiveRecord::Migration[5.1]
  def change
    add_column :speakers, :image, :string
  end
end
