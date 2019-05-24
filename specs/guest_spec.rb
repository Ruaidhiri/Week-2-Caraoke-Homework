require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")
require_relative("../song")
require_relative("../tab")

class TestGuest < Minitest::Test

  def setup
    @song1 = Song.new("Oasis", "Wonderwall")
    @guest1 = Guest.new("Steve", 10, @song1)
  end

  def test_name
    assert_equal("Steve", @guest1.name)
  end

  def test_wallet
    assert_equal(10, @guest1.wallet)
  end

  def test_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end

  def test_cheers_favourite_song
    assert_equal("Woooo!", @guest1.cheers_favourite_song(@song1))
  end

  def test_guest_has_tab
    assert_equal(0, @guest1.guest_tab.tab)
  end

end
