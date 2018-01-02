############################################################
#
# Name: Lara Connelly
# Assignment: Character Playoff
# Date: 05/15/2014
# Class: CIS 283
# Description: Character Class
#
############################################################

class Character
  attr_reader :name, :race, :hit_points, :strength, :agility, :weapon, :armor, :current_hit_points

  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    @hit_points = hit_points
    @strength = strength
    @agility = agility
    @weapon = weapon
    @armor = armor
    @current_hit_points = @hit_points
  end

  def reduce_hits(hit_loss)
    @current_hit_points -= hit_loss
    if @current_hit_points < 0 then @current_hit_points = 0 end   # peg it to zero
  end

  def revive_character
    @current_hit_points = @hit_points
  end

  def current_status
    return "#{@name}'s current hit points: #{@current_hit_points} out of #{@hit_points}"
  end

  def to_s
    ret_str = "========================\n"
    ret_str += "#{@name} the #{@race}.\nHit points: #{@current_hit_points} out of #{@hit_points}\n"
    ret_str += "Strength: #{@strength}\tAgility: #{@agility}\n"
    ret_str += "#{@weapon.to_s}\n#{@armor.to_s}\n"
    ret_str += "========================\n"
    return ret_str
  end
end