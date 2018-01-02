############################################################
#
# Name: Lara Connelly
# Assignment: Jukebox
# Date: 05/05/2014
# Class: CIS 283
# Description: Build a class representing a jukebox that
# contains song classes.
#
############################################################

class Jukebox
  def initialize
    @songs = []
  end

  def add_song( song )
    @songs << song
  end

  def show_all_songs
    return @songs.join("\n")
  end

  def play_song( index )
    ret_str = ""
    # make sure index exists in array
    if @songs.length >= index
      ret_str = @songs[ index - 1 ].play
    else
      ret_str = "Error: Song does not exist"
    end
  end

  def delete_song( index )
    @songs.delete_at( index - 1 )
  end

  def song_menu
    # figured this out from ruby-doc under .collect
    @songs.map.with_index{ |song, index | "(#{index + 1})  #{song.title}\n" }

    #ret_str = ""
    #@songs.each_with_index do |song, index|
    #  ret_str += "(#{index + 1})  #{song.title}\n"
    #end
    #return ret_str
  end

  def update_song( index, song )
    # make sure index exists in array
    if @songs.length >= index
      # replace
      @songs[index - 1] = song
    else
      # add to end of song array
      self.add_song( song )
    end
  end

  def songs_by_artist( artist )
    selected_songs = @songs.select {|song| song.artist.upcase == artist.upcase }
    return selected_songs.join("\n")
  end

  def length_longer_than( length )
    selected_songs = @songs.select {|song| song.length > length }
    return selected_songs.join("\n")
  end

  #return string for file write
  def get_songs
    # create array of to_tab's of song obj using .collect.  join this array with a newline separator.
    return @songs.collect{|song| song.to_tab }.join("\n")
  end

end