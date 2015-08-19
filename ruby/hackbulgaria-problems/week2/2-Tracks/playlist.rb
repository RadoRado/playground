class Playlist
  
  include Enumerable

  attr_reader :tracks  

  def self.from_yaml(path)
    # Your code goes here.
  end

  def initialize(*tracks)
    @tracks = tracks.flatten
  end
  
  def each
    return enum_for(:each) unless block_given?

    @tracks.each do |track|
      yield track
    end
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

  def find_by_name(name)
    # Finds all the tracks by the name. Should return a new Playlist.
  end

  def find_by_artist(artist)
    # Finds all the tracks by the artist. Should return a new Playlist.
  end

  def find_by_album(album)
    # Finds all the tracks from the album. Should return a new Playlist.
  end

  def find_by_genre(genre)
    # Finds all the tracks by genre. Should return a new Playlist.
  end

  def shuffle
    # Give me a new playlist that shuffles the tracks of the current one.
  end

  def random
    # Give me a random track.
  end

  def to_s
    # It should return a nice tabular representation of all the tracks.
    # Checkout the String class for something that can help you with that.
  end

  def &(playlist)
    # Your code goes here. This _should_ return new playlist.
  end

  def |(playlist)
    # Your code goes here. This _should_ return new playlist.
  end

  def -(playlist)
    # Your code goes here. This _should_ return new playlist.
  end

  def ==(other)
    @tracks == other.tracks
  end
end
