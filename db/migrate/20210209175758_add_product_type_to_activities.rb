class AddProductTypeToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :product_type, :boolean, null: false
  end
end
