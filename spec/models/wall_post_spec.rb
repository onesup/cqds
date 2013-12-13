require 'spec_helper'

describe WallPost do
  it ".port_message" do
    # user = FactoryGirl.create(:user, :with_token)
    # wall_post = FactoryGirl.create(:wall_post)
    # expect(wall_post.post_message).to eql("영웅 짱짱맨님의 메세지")
  end
  
  it "매일매일 카운트하기" do
    # 15.times {FactoryGirl.create(:wall_post, :today)}
    # 15.times {FactoryGirl.create(:wall_post, :yesterday)}
    # puts WallPost.first.created_at
    # puts WallPost.last.created_at
    # expect(WallPost.daily_count(Time.now)).to eql(15)
  end
end