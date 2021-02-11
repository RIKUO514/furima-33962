class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
#with_options(?)を使用する  

  validates :nikename,        presence: true 
  validates :password,        presence: true
  validates :fist_name,       presence: true
  validates :list_name,       presence: true 
  validates :fist_name_kana,  presence: true  
  validates :list_name_kana,  presence: true  
  validates :birth_day,       presence: true  



end
