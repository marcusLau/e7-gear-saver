class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :gear_id

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
