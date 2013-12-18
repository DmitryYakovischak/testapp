class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
