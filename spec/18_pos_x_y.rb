require './spec_helper'

describe Robot do
  describe ".robots_in_pos" do
    it "returns all the robots in the given position" do
      Robot.clear_robots
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new

      @robot1.move_up
      expect(Robot.robots_in_pos(0,0).size).to eq(2)
      expect(Robot.robots_in_pos(0,1).size).to eq(1)
    end
  end
end