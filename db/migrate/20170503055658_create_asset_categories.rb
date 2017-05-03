class CreateAssetCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_categories do |t|
      t.string :name
      t.text :description
      t.text :common_details # For serialize

      t.timestamps
    end
  end
end
