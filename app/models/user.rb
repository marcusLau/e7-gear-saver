class User < ApplicationRecord
  validates :username, presence: true

  has_many :gears
  has_many :categories, through: :gears
  has_secure_password

end
