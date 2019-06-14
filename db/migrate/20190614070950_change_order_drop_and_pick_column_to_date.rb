class ChangeOrderDropAndPickColumnToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :drop_off, :date
    change_column :orders, :pick_up, :date
  end
end
