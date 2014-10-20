class RenameCentsToPrice < ActiveRecord::Migration
  def change
  	rename_column :foods, :cents, :price
  end
end
