class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.string :address
      t.datetime :date_time
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :difficulty
      t.string :equipment

      t.timestamps
    end
  end
end
