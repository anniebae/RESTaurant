class CreatePartiesTable < ActiveRecord::Migration
  def change
  	create_table :parties do |t|
  		t.string :name
  		t.integer :size_of_party
  		t.boolean :is_paid, :default => false

  		t.timestamps
  	end
  end
end
 