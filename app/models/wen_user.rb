class WenUser < ActiveRecord::Base
  before_save { self.name }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true

  validates :tel, numericality: { only_integer: true}

  validates :addr, presence: true, length: { maximum: 100 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  has_secure_password
  validates :password, length: { in: 6..20 }

  def WenUser.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def WenUser.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = WenUser.encrypt(WenUser.new_remember_token)
    end

end
