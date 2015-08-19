require 'minitest/autorun'
require_relative 'track'
require_relative 'playlist'

class AwesomeManowarFilter
  def call(track)
    ["Manowar"].include? track.artist
  end
end

class AwesomeDanceFilter
  def call(track)
    track.genre == "dance"
  end

end

class PlaylistTest < Minitest::Test
  extend Minitest::Spec::DSL  

  let(:track1) { Track.new artist:"KAYTRANADA feat. Shay Lia",
                  name: "Leave me alone",
                  album: "So Bad",
                  genre: "Dance" }

  let(:track2) { Track.new artist: "Manowar",
                           name: "Odin",
                           album: "Sonds of Odin",
                           genre: "Metal" }

  let(:full_playlist) { Playlist.new(track1, track2) } 

  def test_two_tracks_are_equal
    assert track1 == track1
  end

  def test_two_tracks_are_not_equal
    assert track1 != track2
  end
   
  def test_playlist_initialization
    playlist = Playlist.new(track1, track2)
    
    p playlist.tracks    
    assert_instance_of Playlist, playlist
  end

  def test_playlist_initialization_with_list
    playlist = Playlist.new([track1, track2])

    assert_instance_of Playlist, playlist
  end

  def test_playlists_are_equal
    p1 = Playlist.new(track1, track2)
    p2 = Playlist.new([track1, track2])

    assert p1 == p2
  end

  def test_each_without_block
    p1 = Playlist.new()

    assert p1.each.respond_to? :next
  end

  def test_each_with_block_given
    counter = 0
    
    full_playlist.each { |track| counter += 1 }

    assert_equal 2, counter
  end
  
  def test_find
    expected = Playlist.new(track2)
    new_playlist = full_playlist.find { |track| ["Manowar"].include? track.artist }
    assert_equal expected, new_playlist 
  end

  def test_find_by_with_one_filter
    expected = Playlist.new(track2)

    new_playlist = full_playlist.find_by AwesomeManowarFilter.new 

    assert_equal expected, new_playlist
  end

  def test_find_by_with_one_filter
    expected = Playlist.new
    new_playlist = full_playlist.find_by AwesomeDanceFilter.new, AwesomeManowarFilter.new 

    assert_equal expected, new_playlist
  end

  def test_find_by_name
    expected = Playlist.new(track2)

    assert_equal expected, full_playlist.find_by_name("Odin")
  end

  def test_find_by_artist
    expected = Playlist.new(track2)

    assert_equal expected, full_playlist.find_by_artist("Manowar")
  end
  
  def test_find_by_album
    expected = Playlist.new(track2)

    assert_equal expected, full_playlist.find_by_album("Sonds of Odin")
  end

  def test_find_by_genre
    expected = Playlist.new(track1)

    assert_equal expected, full_playlist.find_by_genre("Dance")
  end

  def test_shuffle
    shuffled = full_playlist.shuffle

    assert shuffled.has_same_songs(full_playlist)
  end

end
