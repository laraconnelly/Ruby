############################################################
#
# Name: Lara Connelly
# Assignment: Maze Final
# Date: 06/05/2014
# Class: CIS 283
# Description: Main program for maze final.  Provide menu
#   to users to select maze file or quit.
#
############################################################

require_relative "maze_lconnelly"

def menu
  puts ""
  puts " 1) Maze 1"
  puts " 2) Maze 2"
  puts " 3) Maze 3"
  puts " 4) Maze 4"
  puts " 5) Maze 5"
  puts " 6) Maze 6"
  puts " 7) Maze 7"
  puts " 8) Maze 8"
  puts " 9) Maze 9"
  puts "10) Maze 10"
  puts "11) Quit"
  puts ""
  print "Please select a maze from the menu: "
  return gets.chomp.to_i
end

menu_selection = ""
while (menu_selection = menu) != 11
  if (1..10) === menu_selection  # found === with some web research http://www.tutorialspoint.com/ruby/ruby_ranges.htm
    maze_file = "maze#{menu_selection}.mz"
    maze = Maze.new(maze_file)
    maze.print
    maze.solve
    maze.print
  else
    puts
    puts "Invalid Selection"
    puts
  end
end
