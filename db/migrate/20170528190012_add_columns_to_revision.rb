class AddColumnsToRevision < ActiveRecord::Migration[5.0]
  def change
    add_column :revisions, :name, :string
    add_column :revisions, :description, :text, :null => true
  end
end
