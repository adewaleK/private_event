class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  has_many :guests
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :guests, source: :user

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
