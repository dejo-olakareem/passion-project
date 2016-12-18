require 'faker'

users = 20.times.map do
  User.create!( name: Faker::Name.name,
               email: Faker::Internet.email,
               password: 'p123',
               balance: 100)
  end
100.times do |i|
  trs = Transaction.create(borrower_id: rand(1..20), lender_id: rand(1..20), amount: rand(50))
  # trs = Transaction.find(i+1)
  amount = trs.amount

  blnc = trs.borrower.balance + amount
  trs.borrower.update(balance:  blnc)
  blnc = trs.lender.balance - amount
  trs.lender.update(balance:  blnc)
end
