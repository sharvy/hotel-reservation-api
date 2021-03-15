class CreateRoomAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :room_availabilities do |t|
      t.references :hotel, null: false, foreign_key: true
      t.date :date
      t.integer :available_rooms

      t.timestamps
    end
  end
end
