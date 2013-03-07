class HotelFinder

	def initialize (hotels)
		@hotels = hotels
	end
	def findCheapestHotel customerType, dates
		hotels = @hotels.sort_by {|i| i.total(customerType, dates)}
		cheapestPrice = hotels.first.total(customerType, dates)
		hotelsSamePrice = []

		hotels.each do |hotel|
			if cheapestPrice == hotel.total(customerType, dates) 
				hotelsSamePrice.push(hotel)
			end
		end
		
		return hotels.first if (hotelsSamePrice.length == 1)
		return findHighestRated(hotelsSamePrice)
	end

	private 
	def findHighestRated hotels
		hotels = hotels.sort {|a,b| b.rating <=> a.rating}	
		return hotels.first
	end
end