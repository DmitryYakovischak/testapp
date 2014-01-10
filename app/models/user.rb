class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  has_secure_password

  before_save { generate_token(:token) }

  validates :password, confirmation: true
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  private

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
  end

end