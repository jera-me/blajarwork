class AddSlugToSpeakers < ActiveRecord::Migration[5.1]
  def change
    add_column :speakers, :slug, :string
  end
end
