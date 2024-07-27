class RecordAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :house_number, :building_name, :record_id, :phone_number,:user_id, :item_id, :record_id,:token,:price

  
  with_options presence: true do
    
    validates :user_id
    validates :item_id
    # validates :record_id
    validates :token
    validates :postal_code,  format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください" }
    validates :region_id,  numericality: { other_than: 0 , message: "を選択してください" }
    validates :city
    validates :house_number
    validates :phone_number, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "は半角数値のみ入力してください" }
  end
  def save
  
    record = Record.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number, building_name: building_name ,phone_number: phone_number,  record_id: record.id)
  end


end
    # validates :building_name
# end