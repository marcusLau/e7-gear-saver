class User < ApplicationRecord
  has_many :gears
  has_many :categories, through: :gears
  has_secure_password

end
