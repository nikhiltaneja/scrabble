gem 'minitest'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest < Minitest::Test
  attr_reader :frank, :katrina

  def setup
    @frank = Player.new("Frank")
    @katrina = Player.new("Katrina")
  end

  def test_a_player_has_a_name
    assert_equal "Frank", frank.name
  end

  def test_a_player_can_play_a_word
    assert_equal 8, frank.plays("hello")
    assert_equal 9, frank.plays("home")
  end

  def test_a_player_can_track_score
    assert_equal 0, frank.score
    frank.plays("hello")
    frank.plays("home")
    assert_equal 17, frank.score
  end

  def test_a_player_can_assess_relative_position
    frank.plays("hello")
    assert frank.leading?(katrina)
    refute katrina.leading?(frank)
  end

  def test_player_can_have_a_letter
      assert_equal [], frank.letters
      frank.letters = ['a']
      assert_equal ['a'], frank.letters
  end

  def test_player_can_add_a_letter
    frank.letters = ['a']
    frank.add_letter('w')
    assert_equal ['a', 'w'], frank.letters
  end

  def test_player_can_add_letters
    frank.letters = ['a']
    frank.add_letter('w')
    frank.add_letters(['i', 'n', 'd'])
    assert_equal ['a', 'w', 'i', 'n', 'd'], frank.letters
  end
end
