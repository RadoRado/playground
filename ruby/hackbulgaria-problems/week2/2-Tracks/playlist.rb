class Playlist
  
  include Enumerable

  attr_reader :tracks  

  def self.from_yaml(path)
    # Your code goes here.
  end

  def initialize(*tracks)
    @tracks = tracks.flatten
  end
  
  def each(&block)
    return enum_for(:each) unless block_given?
    
    @tracks.each(&block)
  end

  def find(&block)
    Playlist.new(@tracks.find_all(&block))
  end

  def find_by(*filters)
    find do |track|
      filters.all? do |filter|
        filter.call track
      end
    end
  end
  
  def find_by_attribute(attribute_name, attribute_value)
    find { |track| track.instance_eval(attribute_name) == attribute_value }
  end

  def find_by_name(name)
    find_by_attribute("name", name)
  end

  def find_by_artist(artist)
    find_by_attribute("artist", artist)
  end

  def find_by_album(album)
    find_by_attribute("album", album)
  end

  def find_by_genre(genre)
    find_by_attribute("genre", genre)
  end

  def shuffle
    Playlist.new(@tracks.shuffle)
  end

  def random
    @tracks.sample
  end

  def to_s
    # It should return a nice tabular representation of all the tracks.
    # Checkout the String class for something that can help you with that.
  end

  def &(playlist)
    Playlist.new(@tracks + playlist.tracks)
  end

  def |(playlist)
    # Not sure what to do
  end

  def -(playlist)
    Playlist.new(@tracks - playlist.tracks)
  end

  def has_same_songs(other)
    @tracks.to_set == other.tracks.to_set
  end

  def ==(other)
    @tracks == other.tracks
  end
end
