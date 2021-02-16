class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category, :information, :shipping_fee, :area, :days

  with_options presence: true do
  validates :name
  validates :description
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  validates :category_id
  validates :information_id
  validates :shipping_fee_id
  validates :area_id
  validates :days_id
  validates :image
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :information_id
  validates :shipping_fee_id
  validates :area_id
  validates :days_id
  end

  
  
  


end


