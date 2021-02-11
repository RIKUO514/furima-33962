class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nikename,        presence: true
  validates :fist_name,       presence: true
  validates :list_name,       presence: true 
  validates :fist_name_kana,  presence: true  
  validates :list_name_kana,  presence: true  
  validates :birth_day,       presence: true  



end
