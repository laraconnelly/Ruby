############################################################
#
# Name: Lara Connelly
# Assignment: Morse Code Final
# Date: 03/09/2014
# Class: CIS 282
# Description: Translator from text to morse code and morse code to text.
#
############################################################

# create translation hash
def decoder_hash(file, type)
  translator_file = File.open(file, "r")
  translate_alpha_to_morse = Hash.new("")
  translate_morse_to_alpha = Hash.new("")
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

# read in entire file
def read_file(input_file)
  input_file = File.open(input_file, "r")
  text = ""
  while (!input_file.eof?)
    text += input_file.gets.chomp.upcase + "\n"
  end
  input_file.close
  return text
end

# Read Text and Translate to Morse
def text_to_morse(decoder_hash, input_file, output_file)
  text = read_file(input_file)
  morse_file = File.open(output_file, "w")
  morse = ""
  count = 0
  while (count < text.length)
    if (text[count] == " ")
      morse += decoder_hash["WAIT"] + " "
    elsif (text[count] == "\n")
      morse_file.puts morse
      morse = ""
    else
      morse += decoder_hash[text[count]] + " "
    end
    count += 1
  end
  morse_file.close
end


# Read Morse and Translate to Text
def morse_to_text(decoder_hash, input_file, output_file)
  morse = read_file(input_file)
  text_file = File.open(output_file, "w")
  text = ""
  morse_line = morse.split(/\n/)
  morse_line.each do |line|
    morse_letter = line.split(' ')
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
end

text_to_morse(decoder_hash("MorseCodeAlphabet.txt", "to_morse"), "morse_code_text_to_translate.txt", "morse_code_translated.txt")
morse_to_text(decoder_hash("MorseCodeAlphabet.txt", "to_alpha"), "morse_code_translated.txt", "translated.txt")





