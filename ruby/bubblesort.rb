=begin
bubblesort.rb
Written by calicojack1720
Created: 2/2/25
Updated: 2/2/25
=end

# Precondition: sort_arr is an array of integers
# Postcondition: returns the array sorted using bubble sort
def bubble_sort(sort_arr)
  j = sort_arr.length-2
  sort_bit = 0
  while sort_bit == 0
    sort_bit = 1
    for i in 0..j
      if sort_arr[i] > sort_arr[i+1]
        tmp = sort_arr[i]
        sort_arr[i] = sort_arr[i+1]
        sort_arr[i+1] = tmp
        sort_bit = 0
      end
    end
  end

  return sort_arr
end

p bubble_sort([4,3,78,2,0,2])