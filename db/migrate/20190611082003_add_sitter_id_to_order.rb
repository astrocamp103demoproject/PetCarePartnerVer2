class AddSitterIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :sitter
  end
end
