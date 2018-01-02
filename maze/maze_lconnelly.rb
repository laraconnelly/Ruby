############################################################
#
# Name: Lara Connelly
# Assignment: Maze Final
# Date: 06/05/2014
# Class: CIS 283
# Description: Maze Class.  Find shortest path from start to
#     finish of a given maze.
#
############################################################

class Maze

  def initialize( filename )
    # read maze file into a double array
    @mz = []
    @mz_temp = []
    maze_file = File.open(filename)
    while (!maze_file.eof?)
      row = maze_file.gets.chomp.split("")
      @mz << row
      @mz_temp << row.dup
    end

    @found_s = false
    @moves_to_solve = 0
    @s_row = 0
    @s_col = 0
  end

  def print
    puts
    puts

    if @moves_to_solve > 0 && @found_s == false
      puts "NO SOLUTION POSSIBLE"
    else
      @mz.each do |row|
        puts row.join(" ")
      end
      if @found_s == true
        puts
        puts "Maze requires #{@moves_to_solve} moves."
      end
    end
  end

  def solve
    counter = 0
    movement = true
    find_value = "F"

    # count moves from Finish to Start
    while movement == true && @found_s == false
      movement = false
      @mz_temp.each_with_index do |rows, row|
        rows.each_with_index do |value, col|
          if value == find_value
            movement = true
            make_move(row, col, counter)
          end
        end
      end
      find_value = counter
      counter += 1
    end

    # Found the S, now trace path back to F with *'s
    counter = @moves_to_solve - 1
    row = @s_row
    col = @s_col

    while counter >= 0
      # north
      if @mz_temp[ row - 1][ col ] == counter
        @mz[ row - 1][ col ] = "*"
        row = row - 1
      # south
      elsif @mz_temp[ row + 1][ col ] == counter
        @mz[ row + 1][ col ] = "*"
        row = row + 1
      # east
      elsif @mz_temp[ row ][ col + 1 ] == counter
        @mz[ row ][ col + 1 ] = "*"
        col = col + 1
      # west
      elsif @mz_temp[ row ][ col - 1 ] == counter
        @mz[ row ][ col - 1 ] = "*"
        col = col - 1
      end
      counter -= 1
    end
  end


  private

  def make_move( row, col, counter )
    # north
    if row > 0  # bounds checking
      if @mz_temp[ row - 1][ col ] == " "
        @mz_temp[ row - 1][ col ] = counter
        find_s( row - 1, col, counter )
      end
    end

    # south
    if row < ( @mz_temp.length - 1 ) # bounds checking
      if @mz_temp[ row + 1][ col ] == " "
        @mz_temp[ row + 1][ col ] = counter
        find_s( row + 1, col, counter )
      end
    end

    # east
    if col < ( @mz_temp[row].length - 1 )  # bounds checking
      if @mz_temp[ row ][ col + 1 ] == " "
        @mz_temp[ row ][ col + 1 ] = counter
        find_s( row, col + 1, counter )
      end
    end

    # west
    if col > 0  # bounds checking
      if @mz_temp[ row ][ col - 1 ] == " "
        @mz_temp[ row ][ col - 1 ] = counter
        find_s( row, col - 1, counter )
      end
    end
  end

  def find_s( row, col, counter )
    if row > 0 && row < ( @mz.length - 1 ) && col > 0 && col < ( @mz[row].length - 1 ) # bounds check
      #get position
      if @mz[ row - 1][ col ] == "S"
        @s_row = row - 1
        @s_col = col
        @found_s = true
      elsif @mz[ row + 1][ col ] == "S"
        @s_row = row + 1
        @s_col = col
        @found_s = true
      elsif @mz[ row ][ col + 1 ] == "S"
        @s_row = row
        @s_col = col + 1
        @found_s = true
      elsif @mz[ row ][ col - 1 ] == "S"
        @s_row = row
        @s_col = col - 1
        @found_s = true
      end
    end
    @moves_to_solve = counter + 1
  end

end