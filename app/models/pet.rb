class Pet < ApplicationRecord
  validates :name, :size, presence: true

  belongs_to :user
end
