require_relative 'hotel_finder'
require_relative 'hotel'

contents = File.open('input.txt')
contents.each do |line| 
	parsedInput = []
	line.split(/[,:]/).each do |s|
		parsedInput.push(s.strip)
	end

	customerType = parsedInput.first().downcase.to_sym
	dates = parsedInput.slice(1,parsedInput.length)



	lakewood = Hotel.new({:name => 'lakewood', :rating => 3, :weekedayPrice => 110, :weekendPrice => 90, :rewardsWeekdayPrice => 80, :rewardsWeekendPrice => 80 })
	bridgewood = Hotel.new({:name => 'bridgewood', :rating => 4, :weekedayPrice => 160, :weekendPrice => 60, :rewardsWeekdayPrice => 110, :rewardsWeekendPrice => 50 })
	ridgewood = Hotel.new({:name => 'ridgewood', :rating => 5, :weekedayPrice => 220, :weekendPrice => 150, :rewardsWeekdayPrice => 100, :rewardsWeekendPrice => 40 })
	hotels = [lakewood, bridgewood, ridgewood]

	hotelFinder = HotelFinder.new(hotels)
	puts hotelFinder.findCheapestHotel(customerType, dates).name

end	

