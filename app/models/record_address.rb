class RecordAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :record_id, :phone_number,:user_id, :item_id, :record_id

  
  with_options presence: true do
    
    validates :user_id
    validates :item_id
    validates :record_id
    validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください" }
    validates :region_id, presence: true
    validates :city, presence: true
    validates :house_number, presence: true
    validates :phone_number, presence: true, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "は半角数値のみ入力してください" }
  end
  def save
  
    record = Record.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, record_id: record.id)
  end

end
    # validates :building_name
# end