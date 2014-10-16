class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)

	validates :name, uniqueness: true
	
	def to_s
		self.name + "... is our best selling dish."
	end
end

