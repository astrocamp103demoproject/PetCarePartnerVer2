class AddColumnToGmap < ActiveRecord::Migration[5.2]
  def change
    add_column :sitters, :latitude, :float
    add_column :sitters, :longitude, :float
  end
end
