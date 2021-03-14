class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
