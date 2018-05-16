class AddSlugToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :slug, :string
  end
end
