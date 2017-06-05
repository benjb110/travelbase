class AddCoverpicToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :coverpic, :string
  end
end
