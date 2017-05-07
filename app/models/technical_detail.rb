class TechnicalDetail < ApplicationRecord
  belongs_to :asset, optional: true
end
