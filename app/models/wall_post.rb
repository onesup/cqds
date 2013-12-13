class WallPost < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true
  def post_message
'"' + self.message + '" 라고
' +
'' + self.user.name + 
'영웅이 말씀하셨습니다.

댓글기부 ▶ http://bit.ly/173wYGA

영웅의 한마디가 기부금으로 전환되어 
기적의 어린이재활병원 건립 후원금으로 지원됩니다.

지금 기적을 만드는 영웅이 되어주세요!'
  end
  
  def post
    user = self.user
    api = Koala::Facebook::API.new(self.user.token.access_token)
    pictures = %w(posting_img posting_01 posting_02 posting_03)
    picture = "#{Rails.root.to_s}/app/assets/images/#{pictures.shuffle.last}.jpg"
    begin 
      api.put_picture(picture,"image/jpeg", {:message => self.post_message})
    rescue Koala::Facebook::AuthenticationError
      puts "@@@@@@@@@@@@@@@@@"
      puts "Koala::Facebook::AuthenticationError"
      puts "@@@@@@@@@@@@@@@@@"
    end
    Hero.registering(user)
  end
  
  def self.daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
  
  
end
