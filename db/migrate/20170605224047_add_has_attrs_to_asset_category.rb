class AddHasAttrsToAssetCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :asset_categories, :accepts_warranty_details, :boolean, default: false
    add_column :asset_categories, :accepts_technical_details, :boolean, default: false
    add_column :asset_categories, :accepts_security_details, :boolean, default: false
    add_column :asset_categories, :accepts_network_details, :boolean, default: false
    remove_column :asset_categories, :common_details, :string
  end
end
