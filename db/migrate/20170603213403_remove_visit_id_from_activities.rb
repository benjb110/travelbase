class RemoveVisitIdFromActivities < ActiveRecord::Migration[5.0]
  def change
    remove_column :activities, :visit_id, :integer
  end
end
