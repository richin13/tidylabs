class AddColumnToAssetRevision < ActiveRecord::Migration[5.0]
  def change
    add_column :asset_revisions, :asset_id, :integer
    add_column :asset_revisions, :revision_id, :integer
  end
end
