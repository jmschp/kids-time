class AddAdressLatLogToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :lat, :float
    add_column :users, :long, :float
  end
end
