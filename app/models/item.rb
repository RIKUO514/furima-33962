class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category, :information, :shipping_fee, :area, :days

  with_options presence: true do
  validates :name
  validates :description
  validates :price
  validates :user
  end

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :information_id
  validates :shipping_fee_id
  validates :area_id
  validates :days_id
  end

  
  


end


