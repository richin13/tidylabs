class Warranty < ApplicationRecord
  belongs_to :asset, inverse_of: :warranty, optional: true

  validates_presence_of :asset, :purchase_date, :month_period, :agent_name, :agent_phone,
                        message: 'Este campo es requerido'

  def termination_date
    self.purchase_date + self.month_period.months
  end
end
