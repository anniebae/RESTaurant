class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)
	def to_s
		self.name + " comes at least once a week."
	end
end
