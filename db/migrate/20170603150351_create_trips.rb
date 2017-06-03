class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.text :comments
      t.integer :country_id
      t.integer :rating
      t.string :trip_name

      t.timestamps

    end
  end
end
