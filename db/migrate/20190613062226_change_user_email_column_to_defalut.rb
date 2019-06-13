class ChangeUserEmailColumnToDefalut < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string, null: false, default: ""
    change_column :users, :pet_count, :integer, default: 0
  end
end
