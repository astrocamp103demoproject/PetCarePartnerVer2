class AddColumnToPetPic < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :pic, :string
  end
end
