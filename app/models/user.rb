class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers
         
  with_options presence: true do

  validates :nikename

  validates :password,format: { with: /(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:"Include both letters and numbers"}

  with_options format: { with: /[ぁ-んァ-ン一-龥]/ } do
  validates :fist_name
  validates :list_name         
  end

  with_options format: { with: /[ァ-ヶー－]+/} do
  validates :fist_name_kana
  validates :list_name_kana    
  end      

  validates :birth_day

  end
end




