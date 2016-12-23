class Message < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  validates :title , presence: true
  validates :amount , presence: true
end
