class Order < ApplicationRecord
  belongs_to :user
  belongs_to :sitter
  has_one :payment


  include AASM

aasm column: 'state' do
  state :pending, initial: true
  # state :paid, :prepare, :delivered, :refunded, :cancelled
  state :paid, :cancelled

  event :cancel do
    transitions from: :pending, to: :cancelled
  end

  event :pay do
    transitions from: :pending, to: :paid
  end

  # event :prepare do
  #   transitions from: :paid, to: :prepared
  # end

  # event :deliver do
  #   transitions from: :prepared, to: :delivered
  # end

  # event :refund do
  #   transitions from: [:paid, :prepared, :delivered], to: :refunded
  # end
end

end
