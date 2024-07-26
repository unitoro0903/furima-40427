class Address < ApplicationRecord

  belongs_to :record

  
    # validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は「3桁ハイフン4桁」の半角文字列で入力してください" }
    # validates :region_id, presence: true
    # validates :city, presence: true
    # validates :house_number, presence: true
    # validates :phone_number, presence: true, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "は半角数値のみ入力してください" }

end
