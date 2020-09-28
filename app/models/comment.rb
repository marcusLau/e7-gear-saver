class Comment < ApplicationRecord
    validates :user_id, presence: true
    validates :gear_id, presence: true
    validates :content, presence: true

    belongs_to :gears
    has_many :users, through: :gears
  end
  