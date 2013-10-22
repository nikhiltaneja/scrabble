class Scrabble
  def self.score(word)
    return 0 if word.nil? || word.empty?   
    score_letters(word.chars).inject(:+)
  end

  def self.score_letters(letters)
    letters.collect do |letter|
      score_letter(letter)
    end
  end

  def self.score_letter(letter)
    score_card[letter.upcase]
  end

  def self.score_card
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def self.highest_score_from(words)
    #create a variable to hold the highest score
    highest_score = 0
    #create a variable to hold the corresponding word
    high_word = ""
    words.each do |word|
      if score(word) > highest_score
        highest_score = score(word)
        high_word = word
      end
    end
    high_word

  end
end
