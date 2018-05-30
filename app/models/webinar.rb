class Webinar < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => :slugged

  belongs_to :speaker
end
