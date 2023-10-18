class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.datetime :date_time
      t.text :description
      t.integer :difficulty
      t.string :equipment
      t.references :category, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
