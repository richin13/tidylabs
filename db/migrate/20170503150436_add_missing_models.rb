class AddMissingModels < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.string :applicant_name
      t.string :applicant_dni
      t.string :phone_number
      t.date :return_date
      t.string :observations
      t.references :asset, foreign_key: true

      t.timestamps
    end

    create_table :support_tickets do |t|
      t.string :description
      t.integer :status
      t.references :asset, foreign_key: true

      t.timestamps
    end

    create_table :revisions do |t|

      t.timestamps
    end

    create_table :network_details do |t|
      t.string :ip
      t.string :mask
      t.string :gateway
      t.string :dns
      t.references :asset, foreign_key: true

      t.timestamps
    end

    create_table :security_details do |t|
      t.string :username
      t.string :password
      t.references :asset, foreign_key: true

      t.timestamps
    end

    create_table :technical_details do |t|
      t.string :cpu
      t.integer :ram
      t.integer :hdd
      t.string :os
      t.string :other
      t.references :asset, foreign_key: true

      t.timestamps
    end

    create_join_table :assets, :revisions do |t|
      t.index [:asset_id, :revision_id]
      t.index [:revision_id, :asset_id]
    end

    ## Add the PIN column to users table
    add_column :users, :pin, :integer
  end
end
