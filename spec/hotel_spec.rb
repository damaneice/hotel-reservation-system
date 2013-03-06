require 'hotel'
require 'Date'

describe Hotel do
	describe 'Weekend prices for regular customer' do
  		it "should be 80 dollars for Saturday" do
  			dates = [Date.parse('14Mar2009(sat)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 80.0	
  		end

  		it "should be 160 dollars for Saturday" do
  			dates = [Date.parse('14Mar2009(sat)'), Date.parse('14Mar2009(sun)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 160.0	
  		end
  	end
end