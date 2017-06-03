class RemoveAgeFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :age, :integer
  end
end
