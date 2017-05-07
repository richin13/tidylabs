class ChangeIntegerLimitInAssets < ActiveRecord::Migration[5.0]
  def change
    change_column :assets, :serial_number, :integer, limit: 8
  end
end
