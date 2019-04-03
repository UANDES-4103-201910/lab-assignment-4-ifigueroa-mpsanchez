class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validate :date_validator
  validates :start_date, presence: true
  def date_validator
    errors.add(:start_date, "Must be greater than current date") if
        start_date<Date.today
    errors.add("This event can't be today because there is another in the same venue at the same date") if
        Event.where(event_venue_id: event_venue_id, start_date: start_date).count()>0
  end
end
