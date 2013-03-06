class RewardsCustomer
	def price isWeekend, information
		return information[:rewardsWeekendPrice] if isWeekend
		return information[:rewardsWeekdayPrice]
	end
end