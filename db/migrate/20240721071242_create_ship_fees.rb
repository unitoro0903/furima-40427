class CreateShipFees < ActiveRecord::Migration[7.0]
  def change
    create_table :ship_fees do |t|

      t.timestamps
    end
  end
end
