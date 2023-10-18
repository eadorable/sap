class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.references :activity, null: false, foreign_key: true
      t.references :participant, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
