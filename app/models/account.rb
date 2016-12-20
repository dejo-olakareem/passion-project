class Account < ActiveRecord::Base
  # Remember to create a migration!
  has_one :user
  has_many :statements
end
