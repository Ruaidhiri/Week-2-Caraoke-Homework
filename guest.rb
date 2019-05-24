class Guest

attr_reader(:name, :favourite_song)
attr_accessor(:wallet, :guest_tab)

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @guest_tab = Tab.new
  end

  def cheers_favourite_song(song)
    if song == @favourite_song
      "Woooo!"
    end
  end

end
