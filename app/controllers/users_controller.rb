class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create, :login]
  before_action :authenticate_user!, except: [:index, :login]
  skip_before_action :verify_authenticity_token, :only => [:login]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Se creó el colaborador correctamente' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :bad_request }
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'Se actualizó el colaborador correctamente'
    else
      render :edit
    end
  end

  def destroy
    unless @user.admin?
      @user.destroy
      redirect_to users_path, notice: 'Se eliminó el colaborador correctamente'
    else
      redirect_to root_path, alert: 'No se puede eliminar la cuenta de administrador'
    end
  end

  def login
    @user = User.find_by_pin(params[:pin])

    respond_to do |format|
      if @user
        @user.last_sign_in_at = DateTime.now
        @user.save
        format.json { render json: @user }
      else
        # we need to figure out a way to prevent brute-force attacks!
        format.json { render status: 400, json: {message: 'Invalid user credentials'} }
      end
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
