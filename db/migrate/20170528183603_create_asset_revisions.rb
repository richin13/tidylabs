class CreateAssetRevisions < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_revisions do |t|

      t.timestamps
    end
  end
end
