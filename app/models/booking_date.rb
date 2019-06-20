class BookingDate < ApplicationRecord
  belongs_to :sitter

  def start_time
    self.date
  end
end
