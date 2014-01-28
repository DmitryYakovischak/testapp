class User < ActiveRecord::Base
  acts_as_list
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  has_secure_password

  before_save { generate_token(:token) }

  validates :password, confirmation: true
  validates :password, :on => :create, presence: true
  validates :email, presence: true
  validates :email, presence: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  private

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
  end

end