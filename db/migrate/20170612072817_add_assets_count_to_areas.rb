class AddAssetsCountToAreas < ActiveRecord::Migration[5.0]
  def change
    add_column :areas, :assets_count, :integer
  end
end
