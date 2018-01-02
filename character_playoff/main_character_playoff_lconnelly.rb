############################################################
#
# Name: Lara Connelly
# Assignment: Character Playoff
# Date: 05/15/2014
# Class: CIS 283
# Description: Main Program for Character Playoff.  Two file-read characters
# battle it out.
#
############################################################

require_relative "character_lconnelly"
require_relative "dice_lconnelly"
require_relative "weapon_lconnelly"
require_relative "armor_lconnelly"

# Create Global Dice Objects
$d4 = Dice.new(4)
$d8 = Dice.new(8)
$d10 = Dice.new(10)
$d15 = Dice.new(15)

def menu
  puts ""
  puts "1)  Load Character 1"
  puts "2)  Load Character 2"
  puts "3)  Fight"
  puts "4)  Quit"
  print "Enter selection: "
  return gets.chomp.to_i
end

def load_character(character_file)
  character_data_file = File.open(character_file, "r")
  character_data = character_data_file.gets.chomp.split(", ")
  weapon_data = character_data_file.gets.chomp.split(", ")
  weapon = Weapon.new(weapon_data[0], weapon_data[1].to_i)
  armor_data = character_data_file.gets.chomp.split(", ")
  armor = Armor.new(armor_data[0], armor_data[1].to_i)
  character_data_file.close
  return Character.new(character_data[0], character_data[1], character_data[2].to_i, character_data[3].to_i, character_data[4].to_i, weapon, armor)
end

def strike_points(offense, defense)
  hit = 0
  # Does Player hit?
  if $d10.roll < offense.agility
    # Calculate damage
    hit_points = (( offense.strength * ( 1.0 / $d4.roll ) ) + ( offense.weapon.hits_damage / $d8.roll )).to_i
    armor_save = (defense.armor.hits_protection/$d15.roll).to_i
    hit = hit_points - armor_save
    if (hit < 0) then hit = 0 end   # peg it to zero
    # Output for round
    puts "#{offense.name} hits!  #{hit} damage inflicted."
  else
    # Output for round
    puts "#{offense.name} misses!"
  end
  return hit
end

character_1 = ""
character_2 = ""

while (menu_selection = menu) != 4
  if menu_selection == 1      # Load Character 1
    character_1 = load_character("character_1.txt")
    dAgility_char_1 = Dice.new(character_1.agility)
    puts "Character 1 loaded."
    puts character_1.to_s
  elsif menu_selection == 2   # Load Character 2
    character_2 = load_character("character_2.txt")
    dAgility_char_2 = Dice.new(character_2.agility)
    puts "Character 2 loaded."
    puts character_2.to_s
  elsif menu_selection == 3   # Fight
    # Are both characters loaded?
    if character_1 == "" || character_2 == ""
      puts "Error: Must load both characters to fight."
    else
      counter = 1
      character_1.revive_character
      character_2.revive_character
      # Both fighters alive?
      while (character_1.current_hit_points > 0 && character_2.current_hit_points > 0)
        # Determine First Strike (Fighter_1 & Fighter_2)
        if dAgility_char_1.roll >= dAgility_char_2.roll
          fighter_1 = character_1
          fighter_2 = character_2
        else
          fighter_1 = character_2
          fighter_2 = character_1
        end

        # Begin Output for round
        puts ""
        puts "----------------------"
        puts "Round #{counter}"
        puts "#{fighter_1.name} strikes first."

        # Battle
        fighter_2.reduce_hits(strike_points(fighter_1, fighter_2))
        # No second strike if fighter_2 died
        if fighter_2.current_hit_points > 0
          fighter_1.reduce_hits(strike_points(fighter_2, fighter_1))
        end

        # Finish Output for round
        puts fighter_1.current_status
        puts fighter_2.current_status
        counter += 1
        if ( fighter_2.current_hit_points > 0 && fighter_1.current_hit_points > 0 )
          gets   # pause between rounds
        end
      end
      # Output Battle results
      puts "*******************************"
      # Who Won?
      if character_1.current_hit_points == 0
        puts "#{character_2.name} has slain #{character_1.name}."
      else
        puts "#{character_1.name} has killed #{character_2.name}."
      end
      puts "*******************************"
    end
  end
end
