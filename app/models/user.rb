class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :guests
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :attended_events, through: :guests, source: :event

  # def past_events
  #   @past_events = []
  #   self.created_events.each do |event|
  #     datetime = event.date
  #     if datetime < Date.today
  #       @past_events << event
  #     end
  #   end
  #   return @past_events
  # end

  def upcoming_events
    attended_events.where('date > date(\'now\')')
  end

  def previous_events
    attended_events.where('date < date(\'now\')')
  end
end
