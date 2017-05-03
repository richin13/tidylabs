class CreateWarranties < ActiveRecord::Migration[5.0]
  def change
    create_table :warranties do |t|
      t.date    :purchase_date
      t.integer :month_period
      t.string  :agent_name
      t.string  :agent_phone

      t.belongs_to :asset, index: true

      t.timestamps
    end
  end
end
