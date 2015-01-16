class Robot
  @@robots = []

  attr_accessor :position
  attr_accessor :items
  attr_accessor :health
  attr_accessor :equipped_weapon
  attr_reader :shield_points

  def self.robots_in_pos(x,y)
    robots_in_pos = []
    @@robots.each do |robot|
      robots_in_pos << robot if robot.position[0] == x && robot.position[1] == y
    end
    robots_in_pos
  end

  def self.robots
    @@robots
  end

  def self.clear_robots
    @@robots = []
  end

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    @shield_points = 50
    @@robots << self
  end

  def pick_up(item)
    return false if item.weight + items_weight > 250
    if item.is_a?(BoxOfBolts) && @health <= 80
      item.feed(self)
    end
    @items << item
    @equipped_weapon = item if item.is_a?(Weapon)
    true
  end

  def wound(amount)
    amount_past_shield = amount - @shield_points
    @shield_points -= amount
    @shield_points = 0 if @shield_points <= 0
    @health -= amount_past_shield if amount_past_shield >= 0
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def recharge_shield(amount)
    @shield_points += amount
    @shield_points = 50 if @shield_points > 50
  end

  def attack(robot)
    vertical_pos_diff = (position[-1] - robot.position[-1]).abs
    horizontal_pos_diff = (position[0] - robot.position[0]).abs
    return false if @equipped_weapon.nil? && (vertical_pos_diff || horizontal_pos_diff) > 1
    return false if !@equipped_weapon.nil? && @equipped_weapon.range < (vertical_pos_diff || horizontal_pos_diff)  

    if @equipped_weapon
      @equipped_weapon.hit(robot)
      @equipped_weapon = nil if @equipped_weapon.is_a?(Grenade)
    else
      robot.wound(5)
    end
  end

  def items_weight
    @items.inject(0) {|sum, i| sum += i.weight }
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

end
