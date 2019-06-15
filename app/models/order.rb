class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
  has_one :payment
end
