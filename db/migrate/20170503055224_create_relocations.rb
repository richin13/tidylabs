class CreateRelocations < ActiveRecord::Migration[5.0]
  def change
    create_table :relocations do |t|
      t.text    :reason
      
      t.belongs_to :asset, index: true
      t.integer :from_area_id
      t.integer :to_area_id

      t.timestamps
    end
  end
end
