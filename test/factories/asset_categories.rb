FactoryGirl.define do
  factory :category_without_details, class: AssetCategory do
    name 'Equipo de computo'
    description 'Equipos de escritorio y portatiles utilizados en las oficinas y laboratorios del recinto'
    accepts_warranty_details false
    accepts_technical_details false
    accepts_network_details false
    accepts_security_details false
  end

  factory :category_with_all_details, class: AssetCategory do
    name 'Equipo de computo'
    description 'Equipos de escritorio y portatiles utilizados en las oficinas y laboratorios del recinto'
    accepts_warranty_details true
    accepts_technical_details true
    accepts_network_details true
    accepts_security_details true
  end
end
