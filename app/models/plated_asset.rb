class PlatedAsset < Asset
  validates :plate_number, presence: {message: 'Este campo es requerido'},
            uniqueness: {message: 'Ya existe un activo con ese número de placa'}
end
