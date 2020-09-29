class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :comments 
  has_many :commented_gears, through: :comments, foreign_key: "user_id", class_name: "Comment" # 
  has_many :owned_gears, foreign_key: "user_id", class_name: "Gear" 
  has_secure_password

end
