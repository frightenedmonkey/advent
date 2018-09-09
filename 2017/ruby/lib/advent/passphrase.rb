module Advent
  class Passphrase
    def valid? passphrase
      words = passphrase.split(' ')
      words.length == words.uniq.length
    end
  end
end
