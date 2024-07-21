class CreateRequireTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :require_times do |t|

      t.timestamps
    end
  end
end
