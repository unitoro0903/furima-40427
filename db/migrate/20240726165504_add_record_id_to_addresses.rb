class AddRecordIdToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :record, null: false, foreign_key: true
  end
end
