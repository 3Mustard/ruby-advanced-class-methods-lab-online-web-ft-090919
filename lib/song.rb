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
    song = self.new
    self.all << song
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    self.all << song 
    song
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    self.all << song 
    song
  end 
  
  def self.find_by_name(name)
    result = self.all.find {|song| song.name == name}
    result
  end 
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else 
      self.create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    sorted
  end 
  
  def self.new_from_filename(artist_title)
    split_format = artist_title.split(" - ")
    split_format[1] = split_format[1].chomp(".mp3")
    song = self.new 
    song.name = split_format[1]
    song.artist_name = split_format[0]
    self.all << song 
    song 
  end
  
  def self.create_from_filename(name)
    new_file = self.new_from_filename(name)
    song = self.create
    song.name = new_file.name 
    song.artist_name = new_file.artist_name
    song
  end 
  
  def self.destroy_all
    self.all.clear
  end 
end









