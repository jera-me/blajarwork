class Speaker < ApplicationRecord
  extend FriendlyId
  friendly_id :username, :use => :slugged

  has_many :stories

end
