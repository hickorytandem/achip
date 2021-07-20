class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :consultation, null: false, foreign_key: true
      t.date :date_time
      t.integer :status

      t.timestamps
    end
  end
end

