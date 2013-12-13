class User < ActiveRecord::Base
  has_one :token, as: :identifiable
  has_many :wall_posts
  
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
    # Token.create_or_update_token!(fan, access_token)
    fan
  end
  
  def detail_from_facebook(access_token)
    graph = Koala::Facebook::API.new(access_token)
    profile = graph.get_object("me")
    self.name = profile["name"]
    self.profile_image = graph.get_picture(profile["id"])
  end
  
  def fans_to_boxes(integer)
    
  end
end