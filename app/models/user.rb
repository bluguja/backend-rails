class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
  validates_uniqueness_of :email
  validates_presence_of :name, :email
end
