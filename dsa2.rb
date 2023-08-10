# Problem 2 :

# Consider the following series:

# A := 1

# B := A*2 + 2

# C:= B*2 + 3 and so on...

# Write a program that:

# outputs the number corresponding to a given letter;

# given a string of letters like 'GREP', computes the sum of the numbers corresponding to all the letters in the string (i.e., G + R + E + P), as given by the above series; and

# given a large number (that would fit into a standard 32-bit integer), finds the shortest string of letters corresponding to it.

# You may use a greedy approach for the last part. Compute the values of the numbers corresponding to letters as and when required and DO NOT pre-compute beforehand and store them in a data structure.



def number_for_letter(letter)
   occuren = letter.ord - 'A'.ord  
  last = 1
   curr = 1
   

   (1..occuren).each do |ind|
        curr = (last * 2) + ind +1
        last = curr
    end
    return curr

  end
  
  def sum_of_numbers_for_string(str)
    sum = 0
    str.each_char do |char|
      sum += number_for_letter(char)
    end
    sum
  end
  
  def find_shortest_string_for_number(target_number)
    current_number = 0
    shortest_string = ''
    reverse_range = ('A'..'Z').to_a.reverse
    reverse_range.each do |char|
      number = number_for_letter(char)
      while current_number + number <= target_number
        shortest_string += char
        current_number += number
      end
    end
  
    shortest_string
  end
  
  
  puts 'D'.ord - 'A'.ord

  puts sum_of_numbers_for_string('C')

  puts find_shortest_string_for_number(100)

  
# p
# uts reverse_range