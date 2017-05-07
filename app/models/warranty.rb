class Warranty < ApplicationRecord
  belongs_to :asset, inverse_of: :warranty, optional: true

  validates_presence_of :asset, :purchase_date, :month_period, :agent_name, :agent_phone,
                        message: 'Este campo es requerido'

end
