module Advent
  class Jumps
    attr_accessor :offsets, :current_location, :steps

    # the offsets is an array of values; each value in the array shows what the
    # offset for the particular array location (memory location) is.
    def initialize(offsets)
      @offsets = offsets
      @current_location = 0 # always start at the 0 index?
      @steps = 0
      @escaped = false
    end

    def jump!
      move = jump_offset.dup
      next_location = @current_location + move
      if next_location_valid?(next_location)
        increment_current_offset
        @current_location = next_location
        # Now mutate the target location by incrementing by 1
        increment_steps
      else
        # the next move will escape the maze, so increment the steps so we actually
        # jump, and then set escaped to true
        increment_steps
        @escaped = true
      end
    end

    # the location argument corresponds to an index location in the offsets array,
    # so if the offsets array doesn't have that index, then it isn't a valid jump
    # target.
    def next_location_valid? location
      # presumably, a negative location would be invalid
      return false if location.negative?

      # now check whether the location goes out beyond the array bounds in the
      # positive direction
      location < @offsets.length
    end

    # This will return the jump offset value for the current location, which is
    # really just the value of the offset array that current index location
    def jump_offset
      @offsets[@current_location]
    end

    def increment_steps
      @steps = @steps + 1
    end

    def move_until_exit
      while !@escaped
        jump!
      end
    end

    def increment_current_offset
      @offsets[@current_location] += 1
    end
  end
end
