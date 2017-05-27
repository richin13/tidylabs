class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :can_login, :boolean, default: true
  end
end
