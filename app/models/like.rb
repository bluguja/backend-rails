class Like < ApplicationRecord
  belongs_to :likable, polymorphic: true
  belongs_to :user
  validates :likable_id, uniqueness: [:likable_type,:user_id]
end
