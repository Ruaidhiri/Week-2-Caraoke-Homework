require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")
require_relative("../song")
require_relative("../tab")

class TestRoom < Minitest::Test

  def setup
    @blue_room = Room.new("blue_room", 10)
    @song1 = Song.new("Frank Sinatra","My Way")
    @song2 = Song.new("Rick Astley", "Never Gonna Give You Up")
    @guest1 = Guest.new("Heidi", 40, @song1)
    @guest2 = Guest.new("Boris", 100, @song1)
    @guest3 = Guest.new("Jeremy", 0, @song2)
    @guest4 = Guest.new("Nigel", 5, @song2)
  end

  def test_name
    assert_equal("blue_room", @blue_room.name)
  end

  def test_entry_fee
    assert_equal(10, @blue_room.entry_fee)
  end

  def test_room_initializes_empty
    assert_equal([], @blue_room.guests)
  end

  def test_room_initializes_with_no_songs
    assert_equal([], @blue_room.playlist)
  end

  def test_check_in_guest
    @blue_room.check_in_guest(@guest1)
    assert_equal([@guest1],@blue_room.guests)
  end

  def test_check_out_guest
    @blue_room.check_in_guest(@guest1)
    @blue_room.check_in_guest(@guest2)
    @blue_room.check_out_guest(@guest1)
    assert_equal([@guest2], @blue_room.guests)
  end

  def test_new_song
    @blue_room.new_song(@song1)
    assert_equal([@song1], @blue_room.playlist)
  end

  def test_cant_exceed_room_capacity
    @blue_room.check_in_guest(@guest1)
    @blue_room.check_in_guest(@guest2)
    @blue_room.check_in_guest(@guest3)
    @blue_room.check_in_guest(@guest4)
    assert_equal([@guest1, @guest2], @blue_room.guests)
  end

  def test_no_poor_people
    @blue_room.check_in_guest(@guest2)
    @blue_room.check_in_guest(@guest3)
    assert_equal([@guest2], @blue_room.guests)
  end

  def test_guest_will_be_able_to_pay_tab
    @blue_room.check_in_guest(@guest2)
    assert_equal([@guest2], @blue_room.guests)
  end

  def test_guest_wont_be_able_to_pay_tab
    @blue_room.check_in_guest(@guest4)
    assert_equal([], @blue_room.guests)
  end

end
