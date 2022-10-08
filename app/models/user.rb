class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  validates :password,
    length: { minimum: 8, maximum: 32 }
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }  
end
