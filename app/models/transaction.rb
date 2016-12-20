class Transaction < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :borrower, class_name: "User"
  belongs_to :lender, class_name: "User"
end
