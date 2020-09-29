class Comment < ApplicationRecord
    validates :user_id, presence: true
    validates :gear_id, presence: true
    validates :content, presence: true

    belongs_to :gear
    belongs_to :user
  end
  