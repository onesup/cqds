class Winner < ActiveRecord::Base
  belongs_to :user
  belongs_to :gift
end
