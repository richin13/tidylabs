class SecurityDetail < ApplicationRecord
  belongs_to :asset, optional: true

  validates_presence_of :username, :password, message: 'Este campo es requerido'
end
