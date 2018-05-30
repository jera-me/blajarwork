class AddEnddateToWebinars < ActiveRecord::Migration[5.1]
  def change
    add_column :webinars, :enddate, :datetime
  end
end
