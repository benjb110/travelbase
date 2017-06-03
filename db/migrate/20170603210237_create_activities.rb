class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.integer :visit_id
      t.date :when_happened
      t.text :review
      t.integer :activity_rating
      t.boolean :recommend
      t.string :photos

      t.timestamps

    end
  end
end
