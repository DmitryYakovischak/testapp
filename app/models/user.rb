class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email

  validates :first_name, :last_name, :email, presence: true
  validates :email, email_format: { message: "doesn't look like an email address" }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
