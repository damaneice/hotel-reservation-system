require 'hotel'
require 'hotel_finder'
require 'Date'

describe HotelFinder do
	describe 'rewards customer' do
  		it "should be bridgewood hotel" do
        @lakewood =  {:name => "lakewood", :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
        @bridgewood =  {:name => "bridgewood", :rating => 4, :weekedayPrice => 160, :weekendPrice => 110, :rewardsWeekdayPrice => 60, :rewardsWeekendPrice => 50 }
  			dates = [Date.parse('14Mar2009(sat)')]
  			lakewood = Hotel.new(@lakewood)
        bridgewood = Hotel.new(@bridgewood)
        hotels = [lakewood, bridgewood]

        hotelFinder = HotelFinder.new(hotels)
        hotelFinder.findCheapestHotel(:rewards, dates).first.name.should eq "bridgewood" 
  		end
  	end
  end
