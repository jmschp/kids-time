class ChangeColumnToMinAgeFromActivities < ActiveRecord::Migration[6.1]
  def change
    rename_column :activities, :nim_age, :min_age
  end
end
