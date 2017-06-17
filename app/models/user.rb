class User < ApplicationRecord
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :lastname, message: 'Este campo es requerido'

  def active_for_authentication?
    can_login = self.can_login
    if $request
      can_login |= $request.format == 'application/json'
    end
    super && can_login
  end

  def admin?
    self.can_login
  end

  def to_s
    "#{self[:name]} #{self[:lastname]}"
  end

end
