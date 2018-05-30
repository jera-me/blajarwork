class Speaker < ApplicationRecord
  extend FriendlyId
  friendly_id :username, :use => :slugged

  has_many :stories
  has_many :webinars

end
