class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :comments 
  has_many :commented_gears, through: :comments, foreign_key: "user_id", class_name: "Comment" 
  has_many :owned_gears, foreign_key: "user_id", class_name: "Gear" 
  has_secure_password

  def self.find_or_create_by_facebook(auth)
    find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.hex(21) 
    end
  end

end
