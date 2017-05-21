class AddDefaultsToDetailsFields < ActiveRecord::Migration[5.0]
  def change
    change_column :assets, :has_warranty, :boolean, default: false
    change_column :assets, :has_tech_details, :boolean, default: false
    change_column :assets, :has_security_details, :boolean, default: false
    change_column :assets, :has_network_details, :boolean, default: false
  end
end
