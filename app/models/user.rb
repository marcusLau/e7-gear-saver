class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :gears
  has_many :comments, through: :gears
  has_secure_password

end
