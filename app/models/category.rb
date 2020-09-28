class Categories < ApplicationRecord
  validates :user_id, presence: true
  validates :gear_id, presence: true

  has_many :gears
  has_many :users, through: :gears
end
