require 'Date'
require_relative 'customer_factory'

class Hotel
	attr_reader :rating
	attr_reader :name

	def initialize (information)
		@information = information
		@rating = information[:rating]
		@name = information[:name]
   	end	

   	def total customerType, dates
   		amountTotal = 0
   		dates.each do |date|
   			amountTotal = amountTotal + price(customerType, date)
		end
		return amountTotal
   	end

   	private 
   		def weekend? day
   			[0,6].include?(day)
   		end

   		def price customerType, date
   			customer = CustomerFactory.create(customerType)
   			customer.price(weekend?(date.wday), @information) 
   		end

end
