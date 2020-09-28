class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.integer :gear_id
      t.string :content

      t.timestamps
    end
  end
end
