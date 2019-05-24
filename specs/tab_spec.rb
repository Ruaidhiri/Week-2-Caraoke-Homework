require("minitest/autorun")
require("minitest/rg")
require_relative("../tab")

class TestTab < Minitest::Test

  def setup
    @guest_tab = Tab.new
  end

  def test_tab_starts_zero
    assert_equal(0, @guest_tab.tab)
  end

end
