gift = Gift.create(name: "아메리카노")
50.times do |x|
  user = User.create(name: "Wonsup Lee")
  gift.winners.create(user: user)
  puts user.created_at
end