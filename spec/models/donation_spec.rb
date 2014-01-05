require 'spec_helper'

describe Donation do
  it "참여를 두 번 하면 false 반환" do
    user = User.create()
    Donation.registering(user)
    Donation.registering(user)
    expect(Donation.registering(user)).to eql(false)
  end
  
  it "하루에 참여를 세 번 이상 하면 limit 반환" do
    user = User.create()
    Donation.registering(user)
    Donation.registering(user)
    Donation.registering(user)
    expect(Donation.registering(user)).to eql("limit")
  end
  
  it "참여를 한 번 하면 +1" do #seed에 미리 하나 생성해놔서.
    before_total = Donation.last.total
    user = User.create()
    expect( Donation.registering(user) ).to eql(before_total + 1)
  end
  
  it "이 늘어나면 숫자가 올라간다." do
    before_total = Donation.last.total
    18.times do |n|
      user = User.create()
      Donation.registering(user)
    end
    expect(Donation.last.total).to eql(before_total + 18)
  end
  
  it "가 응원을 여러번해도 숫자는 한번만 올라간다." do
    before_total = Donation.last.total
    18.times do |n|
      user = User.create()
      Donation.registering(user)
    end
    expect(Donation.last.total).to eql(before_total + 18)
  end
end
