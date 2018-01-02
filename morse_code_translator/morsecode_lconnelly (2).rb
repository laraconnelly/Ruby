############################################################
#
# Name: Lara Connelly
# Assignment: Morsecode Final
# Date: 03/09/2014
# Class: CIS 282
# Description: Translator from text to morsecode and morsecode to text.
#
############################################################

# create translation hash
def decoder_hash(file, type)
  translator_file = File.open(file, "r")
  translate_alpha_to_morse = Hash.new("")
  translate_morse_to_alpha = Hash.new("")
  #translate_alpha_to_morse.default = ""
  #translate_morse_to_alpha.default = ""
  while (!translator_file.eof?)
    temp_translate = translator_file.gets.chomp.split(' ')
    translate_alpha_to_morse[temp_translate[0]] = temp_translate[1]
    translate_morse_to_alpha[temp_translate[1]] = temp_translate[0]
  end
  translator_file.close
  if (type == "to_alpha")
    return translate_morse_to_alpha
  elsif (type == "to_morse")
    return translate_alpha_to_morse
  end
end

# Read Text and Translate file to morse
def text_to_morse(decoder_hash, input_file, output_file)
  text_file = File.open(input_file, "r")
  morse_file = File.open(output_file, "w")
  text = ""
  morse = ""
  while (!text_file.eof?)
    text = text_file.gets.chomp.upcase
    count = 0
    while (count < text.length)
      if (text[count] == " ")
        morse += decoder_hash["WAIT"] + " "
      else
        morse += decoder_hash[text[count]] + " "
      end
      count += 1
    end
    morse_file.puts morse
    morse = ""
  end
  text_file.close
  morse_file.close
end

# Read Morse and Translate file to text
def morse_to_text(decoder_hash, input_file, output_file)
  morse_file = File.open(input_file, "r")
  text_file = File.open(output_file, "w")
  text = ""
  morse = ""
  while (!morse_file.eof?)
    morse = morse_file.gets.chomp
    morse_letter = morse.split(' ')
    morse_letter.each do |letter|
      if (decoder_hash[letter] == "WAIT")
        text += " "
      else
        text += decoder_hash[letter]
      end
    end
    text_file.puts text
    text = ""
  end
  text_file.close
  morse_file.close
end

#translate_alpha_to_morse = decoder_hash("MorseCodeAlphabet.txt", "to_morse")
#translate_morse_to_alpha = decoder_hash("MorseCodeAlphabet.txt", "to_alpha")
#
#text_to_morse(translate_alpha_to_morse, "morse_code_text_to_translate.txt", "morse_code_translated.txt")
#morse_to_text(translate_morse_to_alpha, "morse_code_translated.txt", "translated.txt")

text_to_morse(decoder_hash("MorseCodeAlphabet.txt", "to_morse"), "morse_code_text_to_translate.txt", "morse_code_translated.txt")
morse_to_text(decoder_hash("MorseCodeAlphabet.txt", "to_alpha"), "morse_code_translated.txt", "translated.txt")





