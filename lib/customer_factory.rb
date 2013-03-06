require_relative 'regular_customer'
require_relative 'rewards_customer'

class CustomerFactory
	def self.create(type)
		if type.eql?(:regular)
			return RegularCustomer.new
		end
		RewardsCustomer.new
	end
end