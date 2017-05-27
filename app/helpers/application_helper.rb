module ApplicationHelper
  def code_as_svg(id_code, size:)
    generate_qr_code(id_code).as_svg(module_size: size)
  end

  private

  def generate_qr_code(id_code)
    RQRCode::QRCode.new(id_code.code, size: 4, level: :h)
  end
end
