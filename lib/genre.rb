class Genre
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def songs
    Song.all.select {|song| song.genre == self}
  end
  
  def artists
    all_artists = self.songs.collect {|song| song.artist}
    all_artists.uniq
  end
  
  def self.all
    @@all
  end
end