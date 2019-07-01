class Comment < ApplicationRecord
  belongs_to :sitter
  belongs_to :user
end
