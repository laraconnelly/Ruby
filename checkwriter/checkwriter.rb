############################################################
#
# Name: Lara Connelly
# Assignment: Check Writer
# Date: 05/23/2014
# Class: CIS 283
# Description: Extend Float class to convert a float to a string.
#
############################################################


class Float
  def to_check_string

    cent_str = ""
    dollar_str = ""
    # Create Number Translation Hash
    number_hash = { 0 => "Zero", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five", 6 => "Six",
        7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten", 11 => "Eleven", 12 => "Twelve",
        13 => "Thirteen", 14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen",
        18 => "Eighteen", 19 => "Nineteen", 20 => "Twenty", 30 => "Thirty", 40 => "Forty",
        50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty", 90 => "Ninety" }

    # Break the number down around decimal point: dollars and cents
    dollars = self.to_i
    cents = ( self * 100 ).round % 100

    # Build DOLLARS string
    # THOUSANDS
    if ( dollars  > 999 )
      thousands = ( dollars % 1000000 ) / 1000
      # hundreds of thousands
      if ( thousands > 99 )
        dollar_str = hundreds_to_string( thousands, number_hash ) + " Hundred "
      end
      # Tens of thousands
       tens = ( dollars % 100000 ) / 1000
      if tens > 0
        dollar_str += tens_to_string( tens, number_hash )
      end
      # If there is a dollar amount AFTER thousand, add a comma
      if dollars % 1000 >= 1
        dollar_str += " Thousand, "
      else
        dollar_str += " Thousand"
      end
    end

    # HUNDREDS
    if ( dollars  > 99 )
      hundreds = dollars % 1000
      if dollar_str.length > 0
        dollar_str += " "
      end
      hundred_str = hundreds_to_string( hundreds, number_hash )
      hundred_str.length > 0 ? dollar_str += hundred_str + " Hundred" : dollar_str = dollar_str.strip #formatting

    end

    # TENS
    tens = dollars % 100
    if tens > 0
      if dollar_str.length > 0  # special case formatting of 10's only ($23.78)
        dollar_str += " "
      end
      dollar_str += tens_to_string( tens, number_hash )   # move the space?
    end
    if ( dollars == 1 )   # single dollar
      dollar_str += " Dollar"
    elsif (dollars == 0)  # deal with zero dollars
      dollar_str = "#{number_hash[0]} Dollars"
    else                  # plural dollar
      dollar_str += " Dollars"
    end

    # CENTS
    cent_str = " and #{tens_to_string( cents, number_hash )}"
    if ( cents == 1 )
      cent_str += " Cent"
    else
      cent_str += " Cents"
    end

    # Formatting
    dollar_str = (dollar_str + cent_str).gsub( "  ", " " )

    return dollar_str
  end

  private
  ###########################################
  # convert the hundreds
  def hundreds_to_string( dollars, number_hash )
    ret_str = ""
    hundred_digit = dollars / 100

    if ( hundred_digit > 0 )
      ret_str = number_hash[hundred_digit]
    end
    return ret_str
  end

  #############################################
  # convert the tens
  def tens_to_string( tens_number, number_hash )
    ret_str = ""
    tens = ( tens_number / 10 ) * 10
    ones = ( tens_number % 10 )

    # 0 thru 19
    if ( tens <= 10 )
      ret_str = number_hash[tens_number]
    # 20 thru 99
    else
      ret_str = number_hash[tens] + " "
      if ( ones > 0 )
        ret_str += number_hash[ones]
      end
    end

    return ret_str
  end

end









