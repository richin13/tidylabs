class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.integer :serial_number
      t.text    :description
      t.integer :plate_number
      t.integer :quantity
      t.integer :status         # Enum
      t.string  :type           # STI

      t.belongs_to :area, index: true
      t.belongs_to :asset_category, index: true

      t.timestamps
    end
  end
end
