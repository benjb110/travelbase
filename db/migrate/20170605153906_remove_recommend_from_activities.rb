class RemoveRecommendFromActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :recommend, :boolean
  end
end
