class RegularCustomer
	def price isWeekend, information
		return information[:weekendPrice] if isWeekend
		return information[:weekedayPrice]
	end
end