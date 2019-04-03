class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  before_save :Date_validation
  def Date_validation
    event_start_date = Event.find(TicketType.find(ticket_type_id).event_id).start_date
    if Order.find(order_id).created_at>event_start_date
      puts("The ticket cannot be created after the start date of the associated event")
      throw :abort
    end
    if event_start_date >= Date.today
      puts("The ticket can't be bought after the start date of the event")
      throw :abort
    end
  end
end
