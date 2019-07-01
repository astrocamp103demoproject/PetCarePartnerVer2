class RemoveSitterForPicture < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pictures, :sitter, index: true, foreign_key: true
  end
end
