class User < ActiveRecord::Base
  has_secure_password
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes
  validates_presence_of :username, :password_digest
  validates_uniqueness_of :username
  validates_confirmation_of :password
end