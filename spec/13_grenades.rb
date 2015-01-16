require './spec_helper'

# Introduce the concept of a ranged weapon: Grenades!
# Weapons now generally have a default range of 1 but grenades have a range of 2

describe Grenade do
  # subject(:grenade) { Grenade.new }
  # it { should be_an(Weapon) }
  # its(:name) { should eq("Grenade") }
  # its(:weight) { should eq(40) }
  # its(:damage) { should eq(15) }
  # its(:range) { should eq(2) }

  describe "#new" do
    it "should create a weapon with the above parameters and a range of 2" do
      @grenade = Grenade.new
      expect(@grenade.is_a?(Weapon)).to eq(true)
      expect(@grenade.name).to eq("Grenade")
      expect(@grenade.weight).to eq(40)
      expect(@grenade.damage).to eq(15)
      expect(@grenade.range).to eq(2)
    end
  end
end

describe Laser do
  # subject(:laser) { Laser.new }
  # its(:range) { should eq(1) }
  describe "#new" do
    it "should create a laser which has a default weapon range of 1" do
      @laser = Laser.new
      expect(@laser.range).to eq(1)
    end
  end
end

