class Weapon < Item

  attr_accessor :damage
  attr_reader :range
  def initialize(name, weight, damage)
    @damage = damage
    @range = 1
    super(name, weight)
  end

  def hit(robot)
    robot.wound(45)
  end
  

end