class Statement < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :account
end
