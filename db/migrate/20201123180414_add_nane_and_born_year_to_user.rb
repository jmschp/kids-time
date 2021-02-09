class AddNaneAndBornYearToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :born_year, :integer
  end
end
