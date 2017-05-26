class RegistrationsController < Devise::RegistrationsController

  protected
  def build_resource(hash=nil)
    super(hash)
    # Basically, if we are creating a non-empty user
    # and already exists a user in the database
    # Then, the new user is not welcome here
    if not hash == {} and (User.count >= 1)
      resource.can_login = false
      resource.save
    end
  end
end