class AddFinishedToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :finished, :boolean, default: false
  end
end
