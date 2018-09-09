module Advent
  class Passphrase
    def valid? passphrase
      words = passphrase.split(' ')
      words.length == words.uniq.length
    end

    def anagram_valid? passphrase
      words = passphrase.split(' ')
      # iterate through each word & return false if there are any words in the
      # rest of the words in the passphrase.
      !words.any? do |word|
        other_words = words.dup - [word]
        other_words.any? do |other|
          anagram? word, other
        end
      end
    end

    def anagram? first, second
      first.chars.sort == second.chars.sort
    end
  end
end
