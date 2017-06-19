class ChangeIdCodeTypeName < ActiveRecord::Migration[5.0]
  def change
    rename_column :identification_codes, :type, :code_type
  end
end
