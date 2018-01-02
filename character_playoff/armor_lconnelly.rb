############################################################
#
# Name: Lara Connelly
# Assignment: Character Playoff
# Date: 05/15/2014
# Class: CIS 283
# Description: Armor Class
#
############################################################

class Armor
  attr_reader :name, :hits_protection

  def initialize(name, hits_protection)
    @name = name
    @hits_protection = hits_protection
  end

  def to_s
    return "Armor: #{@name}, #{@hits_protection} hits"
  end
end