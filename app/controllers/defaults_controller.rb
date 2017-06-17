class DefaultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blocks = [
        {'url': areas_path, 'name': 'Áreas', 'icon': 'building'},
        {'url': assets_path, 'name': 'Activos', 'icon': 'desktop'},
        {'url': revisions_path, 'name': 'Revisiones', 'icon': 'calendar-check-o'},
        {'url': loans_path, 'name': 'Préstamos', 'icon': 'handshake-o'},
        {'url': '', 'name': 'Mantenimiento', 'icon': 'ticket'},
        {'url': users_path, 'name': 'Colaboradores', 'icon': 'users'},
        {'url': '', 'name': 'Reportes', 'icon': 'file-pdf-o'},
        {'url': app_path, 'name': 'Móvil', 'icon': 'android'},
        {'url': help_path, 'name': 'Ayuda', 'icon': 'support'},
    ]
  end

  def app
  end

  def download
    send_file("#{Rails.root}/public/Tidylabs.apk", filename: 'Tidylabs.apk')
  end

  def help

  end
end
