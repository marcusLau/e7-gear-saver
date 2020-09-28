class Gear < ActiveRecord::Base
  validates :level, presence: true
  validates :rarity, presence: true
  validates :equip, presence: true
  validates :main_stat, presence: true
  validates :enhance_lvl, presence: true

  belongs_to :user, optional: true
  has_many :comments

end
