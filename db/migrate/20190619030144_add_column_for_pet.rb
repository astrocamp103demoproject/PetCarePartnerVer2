class AddColumnForPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :type, :string
    add_column :pets, :name, :string
    add_column :pets, :breed, :string
    add_column :pets, :age, :integer
    add_column :pets, :sex, :string
    add_column :pets, :note, :text
  end
end
