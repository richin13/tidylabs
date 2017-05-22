require 'resolv'

class NetworkDetail < ApplicationRecord
  belongs_to :asset, optional: true

  validates :ip, :mask, :gateway, :dns,
            format: {with: Resolv::IPv4::Regex, message: 'Debe ingresar una dirección válida'}
  validates_presence_of :ip, :mask, :gateway, :dns, message: 'Este campo es requerido'
end
