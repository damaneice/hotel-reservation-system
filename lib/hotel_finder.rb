class HotelFinder

	def initialize (hotels)
		@hotels = hotels
	end
	def findCheapestHotel customerType, dates
		@hotels.sort_by {|i| i.total(customerType, dates)}
	end
end