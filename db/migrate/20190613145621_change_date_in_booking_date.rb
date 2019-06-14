class ChangeDateInBookingDate < ActiveRecord::Migration[5.2]
  def change
    change_column :booking_dates, :date, :date
  end
end
