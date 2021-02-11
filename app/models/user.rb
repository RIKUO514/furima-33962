class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         


  validates :nikename,        presence: true 
  validates :password,        presence: true,  format: { with: /(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :fist_name,       presence: true,  format: { with: /[ぁ-んァ-ン一-龥]/ }
  validates :list_name,       presence: true,  format: { with: /[ぁ-んァ-ン一-龥]/ }
  validates :fist_name_kana,  presence: true,  format: { with: /[ァ-ヶー－]+/}
  validates :list_name_kana,  presence: true,  format: { with: /[ァ-ヶー－]+/}
  validates :birth_day,       presence: true  



end
