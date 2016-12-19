require 'faker'
users = 20.times.map do
  account = Account.create(balance: 0,
               debt_bal: 0,
               lend_bal: 0)
  user = User.create( name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'p123',
               account_id:account.id
               )
end


users.each do |user|
    user.messages.create( title: "Need Help",
                            amount: rand(50),
                            user_id: user.id
                            )
end





trs = Transaction.create(borrower_id: 1, lender_id: 2, amount: 50)
# trs = Transaction.find(i+1)
amount = trs.amount

# blnc = trs.borrower.account.balance + amount
# trs.borrower.update(balance:  blnc)
# blnc = trs.lender.account.balance - amount
# trs.lender.update(balance:  blnc)


user = User.find(1)
account = user.account
statement = account.statements.create(amount: 100)
if statement
  account.balance += statement.amount
end

user = User.find(2)
account = user.account
statement = account.statements.create(amount: 100)
if statement
  account.balance += statement.amount
end


user1 = User.find(1)
message = user1.messages.create(title:"please lend",amount: 50)


user2 = User.find(2)
trs = Transaction.create(borrower_id:message.user_id,lender_id:user2.id,amount:message.amount)

if trs
  # update user1 balance with transaction amount and user1 debt balance with transaction amount
  user1.account.balance += trs.amount
  user1.account.debt_bal += trs.amount
  # deduct transaction amount from user2 account and update user2 balance with transaction amount
  user2.account.balance -= trs.amount
  user1.account.lend_bal += trs.amount
end

 # accounts.each do |account|
 #   start = account.statement.create!(account_id: rand(1..20),
 #                            amount: rand(50)
 #                            )

 #   # start.amount
 #  end
