class RemoveDateFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :date, :date
  end
end
