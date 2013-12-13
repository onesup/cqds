require 'spec_helper'

describe ApplicationHelper do
  describe "extract_tens" do
    it "given 18 return [10,8]" do
      expect(helper.extract_tens(18)).to eql([10,8])
    end
    it "given 1 return [0,1]" do
      expect(helper.extract_tens(1)).to eql([0,1])
    end
    it "given 108 return [100,8]" do
      expect(helper.extract_tens(108)).to eql([100,8])
    end
  end
  
  describe "first_blocks" do
    it "given 2 return [0,2]" do
      expect(helper.first_blocks(2)).to eql([0,2])
    end
    it "given 18 return [8,10]" do
      expect(helper.first_blocks(18)).to eql([8,10])
    end
    it "given 30 return [10,10]" do
      expect(helper.first_blocks(30)).to eql([10,10])
    end
  end
  
  describe "second_blocks" do
    it "given 2 return [0,0,0,2]" do
      expect(helper.second_blocks(2)).to eql([0,0,0,2])
    end
    it "given 18 return [0,0,8,10]" do
      expect(helper.second_blocks(18)).to eql([0,0,8,10])
    end
    it "given 28 return [0,8,10,10]" do
      expect(helper.second_blocks(28)).to eql([0,8,10,10])
    end
    it "given 50 return [10,10,10,10]" do
      expect(helper.second_blocks(50)).to eql([10,10,10,10])
    end
  end

  describe "third_blocks" do
    it "given 0 return [0,0,0,2]" do
      expect(helper.third_blocks(0)).to eql([0,0,0,0,0,0])
    end
    it "given 2 return [0,0,0,2]" do
      expect(helper.third_blocks(2)).to eql([0,0,0,0,0,2])
    end
    it "given 18 return [0,0,8,10]" do
      expect(helper.third_blocks(18)).to eql([0,0,0,0,8,10])
    end
    it "given 28 return [0,8,10,10]" do
      expect(helper.third_blocks(28)).to eql([0,0,0,8,10,10])
    end
    it "given 50 return [10,10,10,10]" do
      expect(helper.third_blocks(70)).to eql([10,10,10,10,10,10])
    end
  end
  
  describe "box_set" do
    it "given 56" do
      expect(box_set( (20+36)*100 )).to eql([20,36,0])
    end
    it "given 56" do
      expect(box_set( (20+40+14)*100 )).to eql([20,40,14])
    end
    it "given 56" do
      expect(box_set( 0 )).to eql([0,0,0])
    end
    it "given 56" do
      expect(box_set( (12)*100 )).to eql([12,0,0])
    end
    it "given 56" do
      expect(box_set( (20+40+60+1200)*100 )).to eql([20,40,60])
    end
  end
  
end
