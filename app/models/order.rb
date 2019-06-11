class Order < ApplicationRecord
  belongs_to :user
  has_one :payment
end
