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
        hotelFinder.findCheapestHotel(:rewards, dates).name.should eq "bridgewood" 
  		end

        it "should be lakewood hotel" do
        @lakewood =  {:name => "lakewood", :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 80, :rewardsWeekendPrice => 60 }
        @bridgewood =  {:name => "bridgewood", :rating => 4, :weekedayPrice => 160, :weekendPrice => 110, :rewardsWeekdayPrice => 120, :rewardsWeekendPrice => 50 }
        dates = [Date.parse('14Mar2009(sat)'), Date.parse('15Mar2009(sun)'), Date.parse('16Mar2009(mon)')]
        lakewood = Hotel.new(@lakewood)
        bridgewood = Hotel.new(@bridgewood)
        hotels = [lakewood, bridgewood]

        hotelFinder = HotelFinder.new(hotels)
        hotelFinder.findCheapestHotel(:rewards, dates).name.should eq "lakewood" 
      end
  	end

    describe 'regular customer' do
      it "should be bridgewood hotel" do
        @lakewood =  {:name => "lakewood", :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
        @bridgewood =  {:name => "bridgewood", :rating => 4, :weekedayPrice => 160, :weekendPrice => 110, :rewardsWeekdayPrice => 60, :rewardsWeekendPrice => 50 }
        dates = [Date.parse('14Mar2009(sat)')]
        lakewood = Hotel.new(@lakewood)
        bridgewood = Hotel.new(@bridgewood)
        hotels = [lakewood, bridgewood]

        hotelFinder = HotelFinder.new(hotels)
        hotelFinder.findCheapestHotel(:regular, dates).name.should eq "lakewood" 
      end

        it "should be lakewood hotel" do
        @lakewood =  {:name => "lakewood", :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 80, :rewardsWeekendPrice => 60 }
        @bridgewood =  {:name => "bridgewood", :rating => 4, :weekedayPrice => 160, :weekendPrice => 110, :rewardsWeekdayPrice => 120, :rewardsWeekendPrice => 50 }
        dates = [Date.parse('14Mar2009(sat)'), Date.parse('15Mar2009(sun)'), Date.parse('16Mar2009(mon)')]
        lakewood = Hotel.new(@lakewood)
        bridgewood = Hotel.new(@bridgewood)
        hotels = [lakewood, bridgewood]

        hotelFinder = HotelFinder.new(hotels)
        hotelFinder.findCheapestHotel(:regular, dates).name.should eq "lakewood" 
      end
    end

     describe 'same price' do
      it "should be highest rated hotel" do
        @lakewood =  {:name => "lakewood", :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
        @bridgewood =  {:name => "bridgewood", :rating => 4, :weekedayPrice => 110, :weekendPrice => 110, :rewardsWeekdayPrice => 60, :rewardsWeekendPrice => 50 }
        dates = [Date.parse('16Mar2009(mon)')]
        lakewood = Hotel.new(@lakewood)
        bridgewood = Hotel.new(@bridgewood)
        hotels = [lakewood, bridgewood]

        hotelFinder = HotelFinder.new(hotels)
        hotelFinder.findCheapestHotel(:regular, dates).name.should eq "bridgewood" 
      end
    end
  end
