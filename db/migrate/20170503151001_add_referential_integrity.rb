class AddReferentialIntegrity < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :assets, :areas, on_delete: :cascade
    add_foreign_key :assets, :asset_categories, on_delete: :cascade
    add_foreign_key :identification_codes, :assets, on_delete: :cascade
    add_foreign_key :loans, :assets, on_delete: :cascade
    add_foreign_key :network_details, :assets, on_delete: :cascade
    add_foreign_key :relocations, :assets, on_delete: :cascade
    add_foreign_key :relocations, :areas, on_delete: :cascade, column: 'from_area_id'
    add_foreign_key :relocations, :areas, on_delete: :cascade, column: 'to_area_id'
    add_foreign_key :security_details, :assets, on_delete: :cascade
    add_foreign_key :support_tickets, :assets, on_delete: :cascade
    add_foreign_key :technical_details, :assets, on_delete: :cascade
    add_foreign_key :warranties, :assets, on_delete: :cascade
  end
end
