class CreateIdentificationCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :identification_codes do |t|
      t.string  :code
      t.string  :type

      t.belongs_to :asset, index: true

      t.timestamps
    end
  end
end
