############################################################
#
# Name: Lara Connelly
# Assignment: Morsecode Final
# Date: 03/09/2014
# Class: CIS 282
# Description: Translator from text to morsecode and morsecode to text.
#
############################################################

# Prepare translation Hashes
translate_alpha_to_morse = {}
translate_morse_to_alpha = {}
translator_file = File.open("MorseCodeAlphabet.txt", "r")

while (!translator_file.eof?)
  temp_translate = translator_file.gets.chomp.split(' ')
  translate_alpha_to_morse[temp_translate[0]] = temp_translate[1]
  translate_morse_to_alpha[temp_translate[1]] = temp_translate[0]
end

translator_file.close

# Read Text and Translate file to morse
text_file = File.open("morse_code_text_to_translate.txt", "r")
morse_file = File.open("morse_code_translated.txt", "w")
text = ""
morse = ""
while (!text_file.eof?)
  text = text_file.gets.chomp.upcase
  count = 0
  while (count < text.length)
    if (text[count] == " ")
      morse += translate_alpha_to_morse["WAIT"] + " "
    else
      morse += translate_alpha_to_morse[text[count]] + " "
    end
    count += 1
  end
  morse_file.puts morse
  morse = ""
end
text_file.close
morse_file.close

##############################################################

# Read Morse and Translate file to text
text_file = File.open("translated.txt", "w")
morse_file = File.open("morse_code_translated.txt", "r")
text = ""
morse = ""
while (!morse_file.eof?)
  morse = morse_file.gets.chomp
  morse_letter = morse.split(' ')

  morse_letter.each do |letter|
    if (letter == translate_alpha_to_morse['WAIT'])
      text += " "
    else
      text += translate_morse_to_alpha[letter]
    end
  end
  text_file.puts text
  text = ""
end
text_file.close
morse_file.close








#text_file = File.open("translated.txt", "w")
#morse_file = File.open("morse_code_translated.txt", "r")
#text = ""
#morse = ""
#while (!morse_file.eof?)
#  morse = morse_file.gets.chomp
#  count = 0
#  while (count < morse.length)
#    #temp_product = product.split(',')
#    puts morse[count]
#    if (morse[count] == "WAIT")
#      #text += " "
#    else
#      #text += translate_morse_to_alpha[morse[count]]
#    end
#    count += 1
#  end
#  text_file.puts text
#end
#text_file.close
#morse_file.close



