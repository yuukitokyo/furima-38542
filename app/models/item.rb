class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_state
  belongs_to :delivery_burden
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, presence: true
  

end