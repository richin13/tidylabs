namespace :db_record_updater do
  desc "Generates an identification code for all assets that don't have one"
  task generate_id_codes: :environment do
    assets = Asset.left_outer_joins(:identification_code)

    assets.each do |a|
      code = "ocp_activo_#{a.id}"
      id_code = IdentificationCode.create(code: code, code_type: 'QR', asset_id: a.id)
      a.update_attribute(:identification_code, id_code)
    end
  end
end
