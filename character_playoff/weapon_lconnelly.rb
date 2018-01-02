############################################################
#
# Name: Lara Connelly
# Assignment: Character Playoff
# Date: 05/15/2014
# Class: CIS 283
# Description: Weapon Class
#
############################################################

class Weapon
  attr_reader :name, :hits_damage

  def initialize(name, hits_damage)
    @name = name
    @hits_damage = hits_damage
  end

  def to_s
    return "Weapon: #{@name}, #{@hits_damage} hits"
  end
end