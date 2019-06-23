class ChangeColumnForBookingDateAvailablee < ActiveRecord::Migration[5.2]
  def change
    change_column :booking_dates, :available, :string
  end
end
