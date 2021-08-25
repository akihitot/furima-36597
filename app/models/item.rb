class Item < ApplicationRecord

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, inclusion: { in: 300..9999999 }, format: {with: /\A[0-9]+\z/ }
  validates :image, presence: true
  
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :status
end
