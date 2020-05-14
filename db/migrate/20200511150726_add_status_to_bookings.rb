class AddStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :string, default: "ongoing"
    add_reference :bookings, :canceller, foreign_key: {to_table: :eleves}
    add_column :bookings, :cancellation_time, :datetime
    add_column :bookings, :refundable, :boolean
  end
end
