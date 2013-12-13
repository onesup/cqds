class Token < ActiveRecord::Base
  belongs_to :user
  belongs_to :identifiable, polymorphic: true
  
  def self.create_or_update_token!(user_or_page, access_token)
    token = user_or_page.token
    unless token
      token = user_or_page.build_token
      token.access_token = access_token
      token.save
    else
      token.access_token = access_token
      token.save
    end
  end
end
