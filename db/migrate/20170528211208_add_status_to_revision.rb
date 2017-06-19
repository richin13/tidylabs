class AddStatusToRevision < ActiveRecord::Migration[5.0]
  def change
    add_column :revisions, :open, :boolean, default: true
  end
end
