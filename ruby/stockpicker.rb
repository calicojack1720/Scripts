=begin
stockpicker.rb
Written by calicojack1720
Created: 1/31/2025
Updated: 1/31/2025
=end

# Precondition: stock_arr is an array of stocks with each element representing the stocks on a single day
# Postcondition: returns a pair of days, the first representing the best day to buy and the second the best day to sell
def stock_picker(stock_arr)
  buy_day = 0
  sell_day = 0
  profit = 0

  for i in 0..stock_arr.length-1
    for j in 0..stock_arr.length-1
      if stock_arr[j] - stock_arr[i] > profit
        profit = stock_arr[j] - stock_arr[i]
        buy_day = i
        sell_day = j
      end
    end
  end

  return [buy_day, sell_day]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])