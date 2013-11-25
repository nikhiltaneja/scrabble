require_relative 'scrabble'

class Player
  attr_reader :name, :score
  attr_accessor :letters

  def initialize(name)
    @name = name
    @score = 0
    @letters = []
  end

  def plays(word)
    if can_play?(word) == false
      raise RuntimeError
    else
      played_word_letters = word.chars
      @letters = letters.reject do |letter|
        played_word_letters.include?(letter)
      end

      word_score = Scrabble.score(word)
      @score += word_score
      word_score 
    end
  end

  def leading?(opponent)
    score > opponent.score
  end

  def add_letter(tile)
    letters << tile
  end

  def add_letters(tiles)
    self.letters += tiles
  end

  def can_play?(word)
    potential_word_letters = word.chars
    potential_word_letters.all? { |letter| letters.include?(letter) }
  end

end
