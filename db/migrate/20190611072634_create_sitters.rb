class CreateSitters < ActiveRecord::Migration[5.2]
  def change
    create_table :sitters do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :address
      t.string :avatar
      t.string :pic
      t.integer :square_meters
      t.integer :pet_limit
      t.text :slogan
      t.integer :price

      t.timestamps
    end
  end
end
