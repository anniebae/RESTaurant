class Order < ActiveRecord::Base
	belongs_to(:party)
	belongs_to(:food)
	def to_s
		self.party.to_s + " orders " + self.food.to_s
	end
end