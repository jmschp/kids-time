class RemoveProducttypeFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :product_type, :boolean
  end
end
