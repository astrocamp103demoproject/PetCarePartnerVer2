class ChangeOrderCheckoutColumnToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :checkout_time, :date
  end
end
