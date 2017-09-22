class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(input)
    song = Song.new
    song.name = input
    song
  end

  def self.create_by_name(input)
    song = Song.new_by_name(input)
    @@all << song
    song
  end

  def self.find_by_name(input)
    @@all.detect {|song| song.name == input}
  end

  def self.find_or_create_by_name(input)
    if !Song.find_by_name(input)
      Song.create_by_name(input)
    else
      Song.find_by_name(input)
    end
  end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(filename)
   parts = filename.split(" - ")
   artist_name = parts[0]
   song_name = parts[1].gsub(".mp3", "")

   song = self.new
   song.name = song_name
   song.artist_name = artist_name
   song
 end

 def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

  def self.destroy_all
    self.all.clear
  end

end
