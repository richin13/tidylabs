class Loan < ApplicationRecord
  belongs_to :asset

  validates_presence_of :applicant_name, :applicant_dni, :phone_number, :return_date

  def toggle
    if self.finished
      status = :loan
    else
      status = :unassigned
    end
    self.finished = !self.finished
    self.asset.status = status
    self.save
    self.asset.save
  end
end
