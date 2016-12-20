require 'bcrypt'
class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :debts, class_name: "Transaction", foreign_key: "borrower_id"
  has_many :credits, class_name: "Transaction", foreign_key: "lender_id"
  belongs_to :account
  has_many :messages
  include BCrypt

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(user_email,user_password)
    @user = User.find_by_email(user_email)
    if @user
      @user.password == user_password
    else
      false
    end
  end
end
