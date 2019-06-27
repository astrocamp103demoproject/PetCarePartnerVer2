class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.datetime :drop_off
      t.datetime :pick_up
      t.text :note
      t.string :status
      t.datetime :checkout_time

      t.timestamps
    end
  end
end
