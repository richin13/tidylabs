require 'test_helper'

class AreaTest < ActiveSupport::TestCase
  test "area attributes must not be empty" do
    area = Area.new
    assert area.invalid?
  end
end
