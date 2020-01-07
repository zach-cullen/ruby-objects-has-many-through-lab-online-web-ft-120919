class Artist 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
    
  def new_song(name, genre)
    song = Song.new(name, self, genre)
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end

  def genres
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.uniq
  end
  
  def self.all
    @@all
  end
end