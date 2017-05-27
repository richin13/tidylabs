class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :lastname, message: 'Este campo es requerido'

  def active_for_authentication?
    super && can_login?
  end

  def to_s
    "#{self[:name]} #{self[:lastname]}"
  end

  def can_login?
    self[:can_login]
  end
end
