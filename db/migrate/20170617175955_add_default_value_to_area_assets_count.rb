class AddDefaultValueToAreaAssetsCount < ActiveRecord::Migration[5.0]
  def change
    change_column :areas, :assets_count, :integer, :default => 0
  end
end
