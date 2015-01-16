require './spec_helper'

describe Robot do
  describe "#new" do
    it "robot class should know how many total robots made" do
      Robot.clear_robots
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new

      expect(Robot.robots.size).to eq(3)
    end
  end
end