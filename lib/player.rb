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
    word_score = Scrabble.score(word)
    @score += word_score
    word_score 
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

end
