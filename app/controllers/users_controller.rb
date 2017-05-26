class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.can_login = false
    @user.password = Devise.friendly_token.first(8)

    if @user.save
      redirect_to @user, notice: 'Se creó el colaborador correctamente'
    else
      render :new
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:name, :lastname, :email, :pin)
  end
end
