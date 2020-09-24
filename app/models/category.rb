class Categories < ApplicationRecord
  has_many :gears
  has_many :users, through: :gears
end
