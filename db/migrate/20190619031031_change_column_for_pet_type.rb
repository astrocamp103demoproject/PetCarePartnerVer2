class ChangeColumnForPetType < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :type, :pet_type
  end
end
