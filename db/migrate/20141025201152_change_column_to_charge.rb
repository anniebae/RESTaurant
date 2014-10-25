class ChangeColumnToCharge < ActiveRecord::Migration
  def change
    rename_column :orders, :is_charged, :charge
  end
end
