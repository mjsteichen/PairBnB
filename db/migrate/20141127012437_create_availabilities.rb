class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :residence
      t.belongs_to :pairing
      t.boolean :booked, default: false
      t.date :date

      t.timestamps
    end
  end
end
