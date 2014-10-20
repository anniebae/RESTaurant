class AddDefaultToIsCharged < ActiveRecord::Migration
  def change
  	change_column_default :orders, :is_charged, true
  end
end
