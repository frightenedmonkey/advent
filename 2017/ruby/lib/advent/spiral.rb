module Advent
  class Point
    attr_accessor :x, :y, :counter

    def initialize(x,y, counter = 1)
      @x = x
      @y = y
      @counter = 1
    end

    def manhattan_distance
      x.abs + y.abs
    end

    def current_position
      [x, y]
    end

    def surrounding_coordinates
      surrounding = []
      [-1,1].each do |first_adder|
        first_val = x + first_adder
        surrounding.push [first_val, y]
        [-1,1].each do |second_adder|
          second_val = y + second_adder
          surrounding.push [x, second_val]
          surrounding.push [first_val, second_val]
        end
      end
      surrounding.sort.uniq
    end

    def corner?
      x.abs == y.abs
    end

    def corner_position
      return false if !corner?

      if x.positive? && y.negative?
        :bottom_right
      elsif x.negative? && y.positive?
        :top_left
      elsif x.negative? && y.negative?
        :bottom_left
      elsif x.positive? && y.positive?
        :top_right
      end
    end

    def up
      @y = @y + 1
    end

    def down
      @y = @y - 1
    end

    def left
      @x = @x - 1
    end

    def right
      @x = @x + 1
    end

    def corner_move
      case corner_position
      when :top_right
        :left
      when :bottom_right
        :right
      when :top_left
        :down
      when :bottom_left
        :right
      end
    end

    def move
      mv = next_move
      send(mv)
      @counter = @counter + 1
    end

    # max_axis is a positive integer that is equal to the largest absolute x or y
    # value that can exist.
    def next_move
      if x == 0 && y ==0
        return :right
      end

      if corner?
        return corner_move
      end

      # order of the conditional here matters
      if y.positive? && y >= x.abs
        return :left
      elsif x.negative? && x.abs > y.abs
        return :down
      elsif y.negative? && y.abs > x.abs
        return :right
      elsif x.positive? && x.abs > y
        return :up
      end
    end
  end

  class Spiral
    attr_accessor :point, :max_axis, :board_size

    def walk_the_spiral target_int
      @point = Advent::Point.new(0,0)

      while @point.counter < target_int
        @point.move
      end

      @point.manhattan_distance
    end

    def generate_crazy_board target_value
      @point = Advent::Point.new(0,0)
      board = {}
      board[@point.current_position] = 1

      last_value = 1
      while last_value <= target_value
        @point.move
        surrounding_points = @point.surrounding_coordinates
        new_point_value = surrounding_points.map do |coords|
          board.fetch(coords, 0)
        end.reduce(&:+)
        board[@point.current_position] = new_point_value
        last_value = new_point_value.dup
      end
      last_value
    end
  end
end
