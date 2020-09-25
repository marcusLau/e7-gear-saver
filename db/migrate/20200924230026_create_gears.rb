class CreateGears < ActiveRecord::Migration[5.2]
  def change
    create_table :gears do |t|
      t.integer :level
      t.string :rarity
      t.string :equip
      t.string :main_stat
      t.integer :enhance_lvl

      t.string :stat_1
      t.integer :stat_1_per

      t.string :stat_2
      t.integer :stat_2_per

      t.string :stat_3
      t.integer :stat_3_per
      
      t.string :stat_4
      t.integer :stat_4_per

    end
  end
end
