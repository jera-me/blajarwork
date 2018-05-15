class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :job
      t.string :category
      t.string :link_cv
      t.text :content
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :linkedin
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
