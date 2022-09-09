class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end
  
  def self.create_by_name(song_title)
    song = new_by_name(song_title)
    song.save
    song 
  end

  def self.find_by_name(song_title)
    song = self.all.detect{|song| song.name == song_title}
    song
  end

  def self.find_or_create_by_name(song_title)
    find_by_name(song_title) ? find_by_name(song_title) : create_by_name(song_title) 
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song_name_with_artist = filename.split(".mp3")[0]
    artist_name = song_name_with_artist.split(" - ")[0]
    song_name = song_name_with_artist.split(" - ")[1]
    song = new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end