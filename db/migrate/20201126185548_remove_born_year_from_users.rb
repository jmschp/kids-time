class RemoveBornYearFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :born_year, :integer
  end
end
