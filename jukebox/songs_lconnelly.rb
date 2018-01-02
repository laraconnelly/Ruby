############################################################
#
# Name: Lara Connelly
# Assignment: Jukebox
# Date: 05/05/2014
# Class: CIS 283
# Description: Build a class representing a single song.
#
############################################################

class Song
  attr_accessor :title, :artist, :album, :year, :comments, :length
  def initialize( title, artist, album, year, comments, length )
    @title = title
    @artist = artist
    @album = album
    @year = year
    @comments = comments
    @length = length
  end

  def play
    return "#{@title} is playing."
  end

  def to_tab
    return "#{@title}\t#{@artist}\t#{@album}\t#{@year}\t#{@comments}\t#{@length}"
  end

  def to_s
    return "#{@title} by #{@artist} from #{@album}, #{@year}.  #{@length} seconds long.  #{@comments}"
  end
end