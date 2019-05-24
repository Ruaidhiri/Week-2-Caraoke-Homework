require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Frank Sinatra","My Way")
  end

  def test_artist
    assert_equal("Frank Sinatra", @song1.artist)
  end

  def test_name
    assert_equal("My Way", @song1.name)
  end

end
