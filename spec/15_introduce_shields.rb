require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#new" do
    it "creates a robot with 50 shield points" do
      expect(@robot.shield_points).to eq(50)
    end
  end

  describe "#wound" do
    it "your shield gets damaged before your health" do
      @robot.wound(20)
      expect(@robot.health).to eq(100)
      expect(@robot.shield_points).to eq(30)
    end

    it "your health gets damaged once your shield is done" do
      @robot.wound(70)
      
      expect(@robot.shield_points).to eq(0)
      expect(@robot.health).to eq(80)
    end

  end
  
end
