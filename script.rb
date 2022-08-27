=begin 
1. Takes string
2. Turn string into indexed numbers
    - alphabet in array (index +1)
    - split string in array
    - string_array.each |i| aplhabet_array.index_at(string_array[i]+1) 
3. Shift numbers by X
    - string_number_array.each |item| item + number
4. Return the original method mantaining the original case
    - aplhabet_array.char_at(string_number_array-1)
=end

def caesar_chiper()
    aplhabet_array = [Array('a'..'z'), Array('a'..'z')].flatten #easiest way to cycle through the array 

    # Get string
    puts "Insert a word"
    string = gets.chomp
    string_array = string.split('')
    puts "Insert the shift value (1-25)"

    # Get number
    number = gets.chomp.to_i
    until number.between?(1,25) #26 would print the same word
        puts "Try again"
        number = gets.chomp.to_i
    end
    
    # Turn string array into indexed number array
    string_number_array = []
    string_array.each do |letter|
        if !aplhabet_array.include?(letter.downcase)
            next
        else
            string_number_array << aplhabet_array.index(letter.downcase) + 1 #start index from 1
        end
    end
    
    # Shift to new value
    shifted_array = []
    string_number_array.each {|letter| shifted_array << letter + number}
    
    # Return encrypted word
    encrypted_array = []
    shifted_array.each do |shifted_number|
        encrypted_array << aplhabet_array.values_at(shifted_number - 1) #remove the 1 to get the correct value
    end
    
    # Mantain original case
    string_array.each_with_index do |letter, index|
        if !aplhabet_array.include?(letter.downcase)
            encrypted_array.insert(index, letter)
        end
        if letter.is_upcase?
            encrypted_array.flatten[index].upcase!
        end
    end
    puts encrypted_array.join
end

# Method to define if a letter is upcase
class String
    def is_upcase?
        self == self.upcase
    end
end

caesar_chiper()