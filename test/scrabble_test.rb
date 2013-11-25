gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.score("a")
    assert_equal 4, Scrabble.score("f")
  end

  def test_nil_is_scored_as_zero
    assert_equal 0, Scrabble.score(nil)
  end

  def test_empty_is_scored_as_zero
    assert_equal 0, Scrabble.score("")
  end

  def test_it_scores_a_word
    assert_equal 8, Scrabble.score("hello")
  end

  def test_it_selects_the_highest_scoring_word_from_group
    assert_equal "home", Scrabble.highest_score_from(['home', 'word', 'hello', 'sound'])
  end

  def test_it_breaks_tie_via_fewer_letters
    assert_equal "word", Scrabble.highest_score_from(['hello', 'word', 'sound'])
  end

  def test_it_breaks_tie_via_lucky_number_seven
    assert_equal "silence", Scrabble.highest_score_from(['home', 'word', 'silence'])
  end

  def test_it_breaks_tie_with_first_one_in_supplied_list
    assert_equal "word", Scrabble.highest_score_from(['hi', 'word', 'ward'])
  end
end
