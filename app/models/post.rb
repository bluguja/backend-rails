class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable,  dependent: :destroy
  validates_presence_of :description

end
