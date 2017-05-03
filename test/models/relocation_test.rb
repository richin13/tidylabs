require 'test_helper'

class RelocationTest < ActiveSupport::TestCase
  test "relocation attributes must not be empty" do
    relocation = Relocation.new
    assert relocation.invalid?
  end
end
