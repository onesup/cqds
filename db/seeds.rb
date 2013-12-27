gift = Gift.create(name: "아메리카노", quantity: 100)
50.times do |x|
  user = User.create(name: "Wonsup Lee")
  gift.winners.create(user: user)
  puts user.created_at
end