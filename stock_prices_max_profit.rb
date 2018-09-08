# Given an array of stock prices from yesterday, ordered by time, return the maximum profit you could have made





def get_max_profit stock_prices_yesterday
	current_low = stock_prices_yesterday[0]
	current_profit = 0
	max_low = stock_prices_yesterday[0]
	stock_prices_yesterday.each do |price|
		if price < max_low
			max_low = price
		end
		if price - max_low > current_profit
			current_profit = price - max_low
		end
	end
	return current_profit
end



stock_prices_yesterday = [10, 7, 5, 8, 11, 9]

puts get_max_profit(stock_prices_yesterday)
# returns 6 (buying for $5 and selling for $11)