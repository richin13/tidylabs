require 'test_helper'

class IdentificationCodeTest < ActiveSupport::TestCase
  test "idCode attributes must not be empty" do
    idCode = IdentificationCode.new
    assert idCode.invalid?
  end
end
