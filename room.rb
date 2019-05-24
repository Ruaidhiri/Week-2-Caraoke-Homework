class Room

attr_reader(:name, :capacity, :entry_fee)
attr_accessor(:guests, :playlist)

  def initialize(name, entry_fee)
    @name = name
    @guests = []
    @playlist = []
    @capacity = 2
    @entry_fee = entry_fee
  end

  def check_in_guest(guest)
    if @guests.length < @capacity
      if @entry_fee + guest.guest_tab.tab <= guest.wallet
        @guests << guest
        guest.guest_tab.tab += @entry_fee
      end
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def new_song(song)
    @playlist << song
  end

end
