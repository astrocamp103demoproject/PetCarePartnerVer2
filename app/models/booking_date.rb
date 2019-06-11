class BookingDate < ApplicationRecord
  belongs_to :sitter
  belongs_to :order
end
