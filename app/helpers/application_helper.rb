module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def code_as_svg(id_code, size = 4)
    raw generate_qr_code(id_code).as_svg(module_size: size)
  end

  private

  def generate_qr_code(id_code)
    RQRCode::QRCode.new(id_code.code, size: 4, level: :h)
  end
end
