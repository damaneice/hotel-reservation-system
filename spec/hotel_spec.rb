require 'hotel'
require 'Date'

describe Hotel do
	describe 'regular customer' do
  		it "should be 80 dollars for Saturday" do
  			dates = [Date.parse('14Mar2009(sat)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 80.0	
  		end

  		it "should be 160 dollars for Saturday and Sunday" do
  			dates = [Date.parse('14Mar2009(sat)'), Date.parse('14Mar2009(sun)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 160.0	
  		end

  		it "should be 110 dollars for Monday" do
  			dates = [Date.parse('16Mar2009(mon)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 110.0	
  		end

  		it "should be 220 dollars for Tuesday and Wednesday" do
  			dates = [Date.parse('17Mar2009(tues)'), Date.parse('18Mar2009(wed)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:regular, dates).should eq 220.0	
  		end
  	end

  	describe 'rewards customer' do
  		it "should be 70 dollars for Saturday" do
  			dates = [Date.parse('14Mar2009(sat)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:rewards, dates).should eq 70.0	
  		end

  		it "should be 140 dollars for Saturday and Sunday" do
  			dates = [Date.parse('14Mar2009(sat)'), Date.parse('14Mar2009(sun)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:rewards, dates).should eq 140.0	
  		end

  		it "should be 90 dollars for Monday" do
  			dates = [Date.parse('16Mar2009(mon)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:rewards, dates).should eq 90.0	
  		end

  		it "should be 180 dollars for Tuesday and Wednesday" do
  			dates = [Date.parse('17Mar2009(tues)'), Date.parse('18Mar2009(wed)')]
  			information = { :rating => 3, :weekedayPrice => 110, :weekendPrice => 80, :rewardsWeekdayPrice => 90, :rewardsWeekendPrice => 70 }
  			hotel = Hotel.new(information)

  			hotel.total(:rewards, dates).should eq 180.0	
  		end
  	end
end