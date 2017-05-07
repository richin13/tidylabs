class AddDetailsToAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :has_warranty, :boolean
    add_column :assets, :has_tech_details, :boolean
    add_column :assets, :has_security_details, :boolean
    add_column :assets, :has_network_details, :boolean
  end
end
