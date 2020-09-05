class Event < ApplicationRecord
  has_many :guests
  belongs_to :creator, class_name: "User"
  has_many :attendees, through: :guests, source: :user
end
