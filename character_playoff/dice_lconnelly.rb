############################################################
#
# Name: Lara Connelly
# Assignment: Character Playoff
# Date: 05/15/2014
# Class: CIS 283
# Description: Dice Class
#
############################################################

class Dice
  def initialize(sides_of_dice)
    @sides_of_dice = sides_of_dice
  end

  def roll
    return rand(1..@sides_of_dice)
  end
end