class Gift < ActiveRecord::Base

  has_many :winners
  
  def is_win?(user, betted_at)
    result = false
    golden_time = latest_golden_time(betted_at)
    unless is_before_win?(user)
      if golden_time.to_datetime <= betted_at.to_datetime and 
        self.winners.create!(user: user, gifted_at: golden_time)
        result = true
      end
    end
    return result
  end

  def golden_times
    times = Array.new
    unit_time = ( finished_at - started_at ) / quantity
    i = 0
    quantity.times do |winning|
      times[i] = started_at + ( unit_time * ( i + 1 ) )
      i = i + 1      
    end
    return times
  end
    
  def is_before_win?(user)
    result = false
    result = true unless winners.where(user_id: user.id).empty?
  end
  
  def latest_golden_time(betted_at)
    the_time = golden_times.first
    golden_times.each do |time|
      if time < betted_at
        the_time = time
      end
    end
    return the_time
  end
end
