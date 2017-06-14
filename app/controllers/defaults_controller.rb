class DefaultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blocks = [
        {'url': areas_path, 'name': 'Áreas', 'icon': 'building'},
        {'url': assets_url, 'name': 'Activos', 'icon': 'desktop'},
        {'url': revisions_url, 'name': 'Revisiones', 'icon': 'calendar-check-o'},
        {'url': '', 'name': 'Préstamos', 'icon': 'handshake-o'},
        {'url': '', 'name': 'Mantenimiento', 'icon': 'ticket'},
        {'url': users_path, 'name': 'Colaboradores', 'icon': 'users'},
        {'url': '', 'name': 'Móvil', 'icon': 'android'},
        {'url': '', 'name': 'Reportes', 'icon': 'file-pdf-o'},
        {'url': '', 'name': 'Ayuda', 'icon': 'support'},
    ]
  end
end
