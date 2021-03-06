class User < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true

  validates :tel, numericality: { only_integer: true}

  validates :addr, presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, length: { in: 6..20 }
  
end
