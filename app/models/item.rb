class Item < ApplicationRecord
 
  belongs_to :user
  has_one :record, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :require_time

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :ship_fee_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :require_time_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  


  def sold_out?
    Record.exists?(item_id: self.id)
  end

end
