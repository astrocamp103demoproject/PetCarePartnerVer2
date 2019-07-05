class AddColumnToOrderPetCountAndTotalPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pet_count, :integer
    add_column :orders, :total_price, :integer
  end
end
