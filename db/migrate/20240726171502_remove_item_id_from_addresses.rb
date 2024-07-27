class RemoveItemIdFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_column :addresses, :item_id, :integer
  end
end
