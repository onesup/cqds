require 'spec_helper'

describe Gift do
  it "한 golden_time에 한 user만 당첨" do
    gift = FactoryGirl.create(:gift)
    onesup = FactoryGirl.create(:user, :onesup)
    yang = FactoryGirl.create(:user, :yang)
    betted_at = gift.golden_times[2] + 1.seconds
    gift.is_win?(onesup, betted_at)
    betted_at = gift.golden_times[2] + 1.seconds
    expect(gift.is_win?(yang, betted_at)).to eql(false)
  end
  
  it "is_somebody_before_win?(betted_at)" do
    gift = FactoryGirl.create(:gift)
    onesup = FactoryGirl.create(:user, :onesup)
    betted_at = gift.golden_times[2] + 1.seconds
    Winner.create(user: onesup, gifted_at: betted_at, created_at: betted_at)
    expect(gift.is_somebody_before_win?(betted_at)).to eql(true)
  end
  
  it "시간 나누기" do
    now = Time.now
    quantity = 4
    finished_at = now + 1.day
    gift = Gift.create(started_at: now, finished_at: finished_at, quantity: quantity)
    unit_time = ((finished_at - now) / quantity)
    last_time = now + (unit_time * quantity)
    expect(gift.golden_times.count).to eql(quantity)
    expect(gift.golden_times.last.to_datetime).to eql(last_time.to_datetime)
  end
  
  it "응모" do
    gift = FactoryGirl.create(:gift)
    user = FactoryGirl.create(:user, :onesup)
    betted_at = gift.golden_times.first + 1.seconds
    expect(gift.is_win?(user, betted_at - 1.minute)).to eql(false)
    expect(gift.is_win?(user, betted_at)).to eql(true)
  end
  
  it "응모 다른 타임" do
    gift = FactoryGirl.create(:gift)
    user = FactoryGirl.create(:user, :onesup)
    betted_at = gift.golden_times[-3] + 1.seconds
    gift.is_win?(user, betted_at)
    betted_at = gift.golden_times[-2] + 1.seconds
    expect(gift.is_win?(user, betted_at - 1.minute)).to eql(false)
  end
  
  it "이 전 타임에 당첨자가 안나왔을 경우 중복 당첨 여부" do
    gift = FactoryGirl.create(:gift)
    user = FactoryGirl.create(:user, :onesup)
    betted_at = gift.golden_times.last + 1.seconds
    expect(gift.is_win?(user, betted_at - 1.minute)).to eql(true)
    expect(gift.is_win?(user, betted_at - 1.minute)).to eql(false)
  end
  
  it "당첨자가 또 응모했을 때" do
    gift = FactoryGirl.create(:gift)
    user = FactoryGirl.create(:user, :onesup)
    betted_at = gift.golden_times.first + 1.seconds
    gift.is_win?(user, betted_at)
    expect(gift.is_win?(user, betted_at)).to eql(false)
  end
  
  it "이전에 해당 상품 탄 적 있나?" do
    gift = FactoryGirl.create(:gift)
    onesup = FactoryGirl.create(:user, :onesup)
    yang = FactoryGirl.create(:user, :yang)
    gift.winners.create(user: onesup)
    expect(gift.is_before_win?(onesup)).to eql(true)
  end
  
  it "바로 이전 golden time check" do
    gift = FactoryGirl.create(:gift)
    betted_at = gift.golden_times.last + 30.seconds
    expect(gift.latest_golden_time(betted_at).to_datetime).to eql(gift.golden_times.last.to_datetime)
    betted_at = gift.golden_times.first + 30.seconds
    expect(gift.latest_golden_time(betted_at).to_datetime).to eql(gift.golden_times.first.to_datetime)
  end
end
