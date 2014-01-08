class Donation < ActiveRecord::Base
  belongs_to :user
  
  def self.registering(user)
    last_donation = Donation.order("created_at asc").last
    unless last_donation.nil?
      total_donation = last_donation.total 
    else
      total_donation = 1
    end
    if user.donations.daily_count(Time.now) > 3
      result = "limit"
    else
      if user.donations.count > 1
        user.donations.create!(total: total_donation)
        result = false
      else
        d = user.donations.create!(total: total_donation+1)
        result = d.total
      end
    end
    return result
  end
  
  def self.daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
  
  private
  
end
