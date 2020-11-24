class RemoveMaxAgeFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :max_age, :integer
  end
end
