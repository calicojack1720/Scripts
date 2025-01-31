=begin
substrings.rb
Written by: calicojack1720
Created: 1/30/25
Updated: 1/31/25
=end

# Precondition: sub_str is a string and dict is an array of substrings
# Postcondition: returns a hash of all substrings and a count of how many times it was found
def substrings(sub_str, dict)
    sub_result = Hash.new
    str_arr = sub_str.downcase.split(" ")
    for i in dict
        sub_count = 0
        for j in str_arr
            if j.include?(i)
                sub_count += 1
                sub_result[i] = sub_count
            end
        end
        
    end
    return sub_result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)