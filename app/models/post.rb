class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likable
  validates_presence_of :description

end
