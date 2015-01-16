require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#scanning" do
    it "returns an array of the positions surround robot" do
      positions = @robot.scanning
      left = [-1, 0]
      up = [0, 1]
      right = [1, 0]
      down = [0, -1]
      expect(positions).to eq([left, up, right, down])
    end  
  end
end