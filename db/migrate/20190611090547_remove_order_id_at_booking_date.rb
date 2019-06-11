class RemoveOrderIdAtBookingDate < ActiveRecord::Migration[5.2]
  def change
    remove_reference :booking_dates, :order
  end
end
