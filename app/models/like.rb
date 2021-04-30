class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user
  validates :id, uniqueness: [:likable_type,:likable_id,:user_id]
end
