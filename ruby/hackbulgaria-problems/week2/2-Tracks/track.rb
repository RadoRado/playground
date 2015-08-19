class Track
  attr_accessor :artist, :name, :album, :genre
  
  def initialize(*args, **kwargs)
    if !args.empty? then
      @artist = args[0]
      @name = args[1]
      @album = args[2]
      @genre = args[3]
    else
      @artist = fetch_or_ping(:artist, kwargs)
      @name = fetch_or_ping(:name, kwargs)
      @album = fetch_or_ping(:album, kwargs)
      @genre = fetch_or_ping(:genre, kwargs)
    end
  end

  def ==(other)
    return @artist == other.artist &&
           @name == other.name &&
           @album = other.album &&
           @genre = other.genre
  end

  private

  def fetch_or_ping(key, dict)
    dict.fetch(key) { |x| puts "Please provide #{x}"} 
  end
  
end

