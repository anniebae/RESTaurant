class CreateFoodsTable < ActiveRecord::Migration
  def change
  	create_table :foods do |t|
  		t.string :name
  		t.integer :cents

  		t.timestamps
  	end
  end
end
