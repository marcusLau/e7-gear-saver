class Gear < ActiveRecord::Base
  validates :level, presence: true
  validates :rarity, presence: true
  validates :equip, presence: true
  validates :main_stat, presence: true
  validates :enhance_lvl, presence: true
  validates :stat_1_per, presence: true
  validates :stat_2_per, presence: true
  validates :stat_3_per, presence: true
  validates :stat_4_per, presence: true

  belongs_to :user, optional: true
  has_many :comments

  def self.substats
    options = ['Attack', 'Atk %', 'Health %', 'Defense', 'Defense %', 'Speed', 'Crit Chance %', 'Crit Damage %', 'Effectiveness %', 'Effectiveness Resist %'] 
  end
  
end
