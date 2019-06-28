class CreateBookingDates < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_dates do |t|
      t.references :sitter, foreign_key: true
      t.references :order, foreign_key: true
      t.datetime :date
      t.boolean :available

      t.timestamps
    end
  end
end
