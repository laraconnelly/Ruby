############################################################
#
# Name: Lara Connelly
# Assignment: Jukebox
# Date: 05/05/2014
# Class: CIS 283
# Description: Main program to manipulate the jukebox
# and song classes.
#
############################################################

require_relative "songs_lconnelly"
require_relative "jukebox_lconnelly"

def menu
  puts ""
  puts "1) Show all songs longer than entered value (in seconds)"
  puts "2) Show all songs by artist"
  puts "3) Play a song"
  puts "4) Add a new song to jukebox"
  puts "5) Delete a song from jukebox"
  puts "6) Update a song in the jukebox"
  puts "7) Show all songs in the jukebox"
  puts "8) Quit"
  puts ""
  print "Please make a menu selection: "
  return gets.to_i
end

# Read in songs file
songs_file = File.open("songs.txt", "r")    #read only mode

# create songs, load jukebox
jukebox = Jukebox.new
while (!songs_file.eof?)
  song_data = songs_file.gets.chomp.split("\t")
  song = Song.new( song_data[0], song_data[1], song_data[2], song_data[3].to_i, song_data[4], song_data[5].to_i )
  jukebox.add_song( song )
end
songs_file.close

menu_selection = ""
while (menu_selection = menu) != 8
  if menu_selection == 1                    # Show song(s) by length
    print "Enter length (in sec): "
    puts jukebox.length_longer_than( gets.chomp.to_i )
  elsif menu_selection == 2                 # Show songs by artist
    print "Enter artist: "
    puts jukebox.songs_by_artist( gets.chomp )
  elsif menu_selection == 3                 # Play song
    puts jukebox.song_menu
    print "Enter song number to play: "
    puts jukebox.play_song( gets.chomp.to_i )
  elsif menu_selection == 4                 # Add song
    # Gather data
    print "Enter title: "
    title = gets.chomp
    print "Enter artist: "
    artist = gets.chomp
    print "Enter album: "
    album = gets.chomp
    print "Enter year: "
    year = gets.chomp.to_i
    print "Enter comments: "
    comments = gets.chomp
    print "Enter length (in seconds): "
    length = gets.chomp.to_i
    # Enter song
    song = Song.new( title, artist, album, year, comments, length )
    jukebox.add_song( song )
  elsif menu_selection == 5                 # Delete
    puts jukebox.song_menu
    print "Enter song number to delete: "
    jukebox.delete_song( gets.chomp.to_i )
  elsif menu_selection == 6                 # Update song
    puts jukebox.song_menu
    print "Enter song number to update: "
    index = gets.chomp.to_i
    # Gather data
    print "Enter title: "
    title = gets.chomp
    print "Enter artist: "
    artist = gets.chomp
    print "Enter album: "
    album = gets.chomp
    print "Enter year: "
    year = gets.chomp.to_i
    print "Enter comments: "
    comments = gets.chomp
    print "Enter length (in seconds): "
    length = gets.chomp.to_i
    # create new song
    song = Song.new( title, artist, album, year, comments, length )
    # update song
    jukebox.update_song( index, song )
  elsif menu_selection == 7                 # Show all songs
    puts jukebox.show_all_songs
  end
end

# write songs to file
songs_file = File.open("songs.txt", "w")
songs_file.puts jukebox.get_songs
songs_file.close
