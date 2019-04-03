class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  def Date_validation
    if Order.find(order_id).created_at>Event.find(event_id).start_date
      throw :abort
    end
    if Event.find(event_id).start_date>created_at
      throw :abort
    end
  end
end
