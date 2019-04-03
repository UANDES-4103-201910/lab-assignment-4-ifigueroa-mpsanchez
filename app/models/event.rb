class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validate :date_validator
  validates :start_date, presence: true
  def date_validator
    errors.add(:start_date, "Must be greater than current date") if
        start_date<Date.today
  end
end
