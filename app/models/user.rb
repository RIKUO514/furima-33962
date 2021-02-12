class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  with_options presence: true do

  validates :nikename
  validates :password,          format: { with: /(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :fist_name,         format: { with: /[ぁ-んァ-ン一-龥]/ }
  validates :list_name,         format: { with: /[ぁ-んァ-ン一-龥]/ }
  validates :fist_name_kana,    format: { with: /[ァ-ヶー－]+/}
  validates :list_name_kana,    format: { with: /[ァ-ヶー－]+/}
  validates :birth_day        
  end

end
