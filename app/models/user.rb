class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable  
  include DailyCount
  has_one :token, as: :identifiable
  has_many :donations
  scope :top_donator, order('donations_count DESC')

  
  def daily_donations(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.donations.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).count
  end
  
  def self.create_or_find_fan!(uid, access_token)
    unless exists?(uid: uid)
      fan = User.new
      Token.create_or_update_token!(fan, access_token)
      fan.uid = uid
      fan.detail_from_facebook(access_token)
      fan.save
    else
      fan = find_by_uid(uid)
      Token.create_or_update_token!(fan, access_token)
      fan.detail_from_facebook(access_token)
      fan.save
    end
    fan
  end
  
  def detail_from_facebook(access_token)
    graph = Koala::Facebook::API.new(access_token)
    profile = graph.get_object("me")
    relationship = graph.fql_query("SELECT relationship_status  FROM user where uid=me()") 
    self.name = profile["name"]
    self.gender = profile["gender"]
    self.age = profile["birthday"]
    self.location = profile["location"]["name"] unless profile["location"].nil?
    self.profile_image = graph.get_picture(profile["id"])
    self.relationship = relationship.first["relationship_status"]
  end  
end