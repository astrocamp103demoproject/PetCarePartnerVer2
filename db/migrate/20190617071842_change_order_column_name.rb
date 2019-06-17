class ChangeOrderColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :status, :state
  end
end
