class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
  	song = Song.new()
  	song.save
  	song
  end

  def self.new_by_name(name)
  	song = Song.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	song = Song.new_by_name(name)
  	song.save
  	song
  end

  def self.find_by_name(name)
  	Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	song = Song.find_by_name(name)
  	song ||= Song.create_by_name(name)
  end

  def self.alphabetical
  	Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	info = filename.gsub(".mp3", "").split(" - ")
  	song = Song.create_by_name(info[1])
  	song.artist_name = info[0]
  	song
  end

  def self.create_from_filename(filename)
  	info = filename.gsub(".mp3", "").split(" - ")
  	song = Song.create_by_name(info[1])
  	song.artist_name = info[0]
  	song.save
  	song
  end

  def self.destroy_all
  	@@all = []
  end



  def save
    self.class.all << self
  end

end
