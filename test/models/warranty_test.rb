require 'test_helper'

class WarrantyTest < ActiveSupport::TestCase
  test "warranty attributes must not be empty" do
    warranty = Warranty.new
    assert warranty.invalid?
  end
end
