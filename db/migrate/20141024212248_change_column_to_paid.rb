class ChangeColumnToPaid < ActiveRecord::Migration
  def change
    rename_column :parties, :is_paid, :paid
  end
end
