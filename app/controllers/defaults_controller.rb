class DefaultsController < ApplicationController
  before_action :authenticate_user!, except: [:status]

  def index
    @blocks = [
      { url: areas_path, name: 'Áreas', icon: 'building' },
      { url: assets_path, name: 'Activos', icon: 'desktop' },
      { url: revisions_path, name: 'Revisiones', icon: 'calendar-check-o' },
      { url: loans_path, name: 'Préstamos', icon: 'handshake-o' },
      { url: categories_path, name: 'Categorías', icon: 'folder-o' },
      { url: users_path, name: 'Colaboradores', icon: 'users' },
      { url: app_path, name: 'Móvil', icon: 'android' },
      { url: help_path, name: 'Ayuda', icon: 'support' },
    ]
  end

  def app
    @screenshots = Dir.glob("app/assets/images/mobile_app/*.jpg")
  end

  def download
    send_file("public/Tidylabs.apk", filename: 'Tidylabs.apk')
  end

  def help

  end

  def status
    respond_to do |format|
      format.html
      format.json
    end
  end
end
