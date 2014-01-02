started_at = Time.now - 1.day
finished_at = Time.now + 1.month
gift = Gift.create(name: "쿠크다스", quantity: 100, started_at: started_at, finished_at: finished_at)
user = User.create(name: "Wonsup Lee")
# 50.times do |x|
#   user = User.create(name: "Wonsup Lee")
#   gift.winners.create(user: user)
#   puts user.created_at
# end