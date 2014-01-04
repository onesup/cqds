require 'spec_helper'

describe User do
  it "가 기부 세번 하면 3 반환" do
    user = User.create()
    Donation.registering(user)
    Donation.registering(user)
    Donation.registering(user)
    expect(user.daily_donations(Time.now)).to eql(3)
  end
end
