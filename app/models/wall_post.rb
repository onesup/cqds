class WallPost < ActiveRecord::Base
  belongs_to :user
  validates :message, presence: true
  def self.post_message
'쿠크~ 가슴뛰는 선물!
 
지금 쿠크다스 페이지에 가서 "기부하기" 버튼만 누르면,
심장병 어린이에게 기부를! 나에게는 쿠크다스의 행운이! 
지금 참여하세요! 쿠크다스를 무료로!!   
기부하기 ▶ http://bit.ly/cqdas'
  end
  
  def self.post(user)
    api = Koala::Facebook::API.new(user.token.access_token)
    # pictures = %w(posting_img posting_01 posting_02 posting_03)
    picture = "#{Rails.root.to_s}/app/assets/images/posting_img.jpg"
    begin 
      api.put_picture(picture,"image/jpeg", {:message => WallPost.post_message})
    rescue Koala::Facebook::AuthenticationError
      Rails.logger.info "@@@@@@@@@@@@@@@@@"
      Rails.logger.info "Koala::Facebook::AuthenticationError"
      Rails.logger.info "@@@@@@@@@@@@@@@@@"
    end
  end
  
  def self.daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
  
  
end
