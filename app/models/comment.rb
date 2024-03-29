class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likable, dependent: :destroy
  validates_presence_of :description
end

