class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :Date_validation
  def Date_validation
    if Order.find(order_id).created_at>Event.find(event_id).start_date
      throw :abort
    end
    if Event.find(TicketType.find(ticket_type_id).event_id).start_date>created_at
      throw :abort
    end
  end
end
