class Donation < ActiveRecord::Base
  belongs_to :user
  
  def self.registering(user)
    total_donation = Donation.order("created_at asc").last.total
    puts "last_id: " + Donation.order("created_at asc").last.id.to_s
    puts "@@@@@@"+total_donation.to_s
    if user.donations.count > 1
      user.donations.create!(total: total_donation)
      puts "true"
      return false
    else
      d = user.donations.create!(total: total_donation+1)
      puts "false"+d.total.to_s
      return d.total
    end
  end
  
  def self.daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
  
  private
  
end
