class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string           :title        , null: false
      t.text             :explanation  , null: false
      t.references       :user        , null: false , foreign_key: true
      t.integer          :price, null: false
      t.integer          :category_id, null: false
      t.integer          :condition_id, null: false
      t.integer          :region_id, null: false
      t.integer          :ship_fee_id, null: false
      t.integer          :require_time_id, null: false
    end
  end
end
