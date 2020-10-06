class Gear < ActiveRecord::Base
  validates :level, presence: true
  validates :rarity, presence: true
  validates :equip, presence: true
  validates :main_stat, presence: true
  validates :enhance_lvl, presence: true

  belongs_to :user, optional: true
  has_many :comments


  def self.substats
    options = ['Attack', 'Atk %', 'Health %', 'Defense', 'Defense %', 'Speed', 'Crit Chance %', 'Crit Damage %', 'Effectiveness %', 'Effectiveness Resist %'] 
  end
  
  # # returns an array of strings of options for what an user can create for main_stat when an equip type is selected
  # def self.check_main(equip) # :equip passing in a symbol ":equip"?
  #   case equip
  #   when 'Weapon'
  #     ['Attack']
  #   when 'Helm'
  #     ['Health']
  #   when 'Armor'
  #     ['Defense']
  #   when 'Necklace'
  #     ['Attack', 'Attack %', 'Health', 'Health %', 'Defense', 'Defense %', 'Crit Chance %', 'Crit Damage %']
  #   when 'Ring'
  #     ['Effectiveness %', 'Effect Resistance %', 'Attack', 'Attack %', 'Health', 'Health %', 'Defense', 'Defense %']
  #   when 'Boots'
  #     ['Speed', 'Attack', 'Attack %', 'Health', 'Health %', 'Defense', 'Defense %']
  #   end
  #   #binding.pry
  # end
end
