require 'math'

module Advent

  class Spiral
    include Math
    def self.generate! num
    end

    # to determine the size of the board, we need to find the square root of the
    # largest int. The next largest odd integer is the width & height of the board.
    # The square of that should tell us the largest integer on the board as well.
    def size_board largest_int
      floor = Integer(Math.sqrt(largest_int))
      #return floor if ((floor * floor) == largest_int)

      if floor.even?
        floor + 1
      else
        floor + 2
      end
    end
  end
end
