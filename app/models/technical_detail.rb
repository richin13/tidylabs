class TechnicalDetail < ApplicationRecord
  belongs_to :asset, optional: true

  validates_presence_of :cpu, :ram, :hdd, :os, message: 'Este campo es requerido'

  def hdd_to_nice
    if hdd / 1000 >= 1
      tbs = hdd / 1000
      tbs.to_s + ' TB'
    else
      hdd.to_s + ' GB'
    end
  end
end
