class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :guests
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :attended_events, through: :guests, source: :event
end
