class CreateOrdersTable < ActiveRecord::Migration
  def change
  	create_table :orders do |order|
  		order.integer :food_id
  		order.integer :party_id
  		order.boolean :is_charged

  		order.timestamps
  	end
  end
end
