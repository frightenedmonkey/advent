require 'spec_helper'

describe Advent::Spiral do
  describe '#walk_the_spiral' do
    it 'should be return the right manhattan distance' do
      expect(subject.walk_the_spiral(11)).to eq(2)
      expect(subject.walk_the_spiral(23)).to eq(2)
      expect(subject.walk_the_spiral(21)).to eq(4)
      expect(subject.walk_the_spiral(26)).to eq(5)
      expect(subject.walk_the_spiral(347991)).to eq(480)
    end
  end
  describe '#generate_crazy_board' do
    it 'should be return the right manhattan distance' do
      expect(subject.generate_crazy_board(11)).to eq(23)
      expect(subject.generate_crazy_board(23)).to eq(25)
      expect(subject.generate_crazy_board(54)).to eq(57)
      expect(subject.generate_crazy_board(133)).to eq(142)
      expect(subject.generate_crazy_board(347991)).to eq(349975)
    end
  end
end

describe Advent::Point do
  subject { Advent::Point.new(1,-2) }
  describe '#manhattan_distance' do
    it 'should return the sum of the absolute value of the x,y' do
      expect(subject.manhattan_distance).to eq(3)
    end
  end
  describe '#current_position' do
    it 'should return the x, y values in an array' do
      expect(subject.current_position).to eq([1,-2])
    end
  end

  describe '#corner?' do
    context 'the abs value of the coordinates are equal' do
      subject { Advent::Point.new(5, -5) }
      it 'should return true' do
        expect(subject.corner?).to be true
      end
    end
    context 'the abs value of the coordinates are not equal' do
      subject { Advent::Point.new(5, -4) }
      it 'should return true' do
        expect(subject.corner?).to be false
      end
    end
  end

  describe 'movements' do
    subject { Advent::Point.new(1,-2) }
    it 'should increment y when moving up' do
      subject.up
      expect(subject.current_position).to eq([1, -1])
    end
    it 'should decrement y when moving down' do
      subject.down
      expect(subject.current_position).to eq([1, -3])
    end
    it 'should increment x when moving right' do
      subject.right
      expect(subject.current_position).to eq([2, -2])
    end
    it 'should decrement x when moving left' do
      subject.left
      expect(subject.current_position).to eq([0, -2])
    end
  end

  describe '#corner_position' do
    context 'x == 2 && y == 2' do
      subject { Advent::Point.new(2, 2) }
      it 'should be :top_right' do
        expect(subject.corner_position).to eq(:top_right)
      end
    end
    context 'x == -2 && y == 2' do
      subject { Advent::Point.new(-2, 2) }
      it 'should be :top_left' do
        expect(subject.corner_position).to eq(:top_left)
      end
    end
    context 'x == -2 && y == -2' do
      subject { Advent::Point.new(-2, -2) }
      it 'should be :bottom_left' do
        expect(subject.corner_position).to eq(:bottom_left)
      end
    end
    context 'x == 2 && y == -2' do
      subject { Advent::Point.new(2, -2) }
      it 'should be :bottom_right' do
        expect(subject.corner_position).to eq(:bottom_right)
      end
    end
  end
  describe '#next_move' do
    subject { Advent::Point.new(2, 2) }
    context 'not on a corner & the max_axis is 3' do
      it 'should be :left' do
        subject.x = 2
        subject.y = 2
        expect(subject.next_move).to eq(:left)
      end
      it 'should be :right' do
        subject.x = -2
        subject.y = -3
        expect(subject.next_move).to eq(:right)
      end
      it 'should be :up' do
        subject.x = 3
        subject.y = 0
        expect(subject.next_move).to eq(:up)
      end
      it 'should be :down' do
        subject.x = -3
        subject.y = 0
        expect(subject.next_move).to eq(:down)
      end
    end
    context 'on a corner & the max_axis is 3' do
      it 'should be :left' do
        subject.x = 3
        subject.y = 3
        expect(subject.next_move).to eq(:left)
      end
      it 'should be :right' do
        subject.x = -3
        subject.y = -3
        expect(subject.next_move).to eq(:right)
      end
      it 'should be :right' do
        subject.x = 3
        subject.y = -3
        expect(subject.next_move).to eq(:right)
      end
      it 'should be :down' do
        subject.x = -3
        subject.y = 3
        expect(subject.next_move).to eq(:down)
      end
    end
  end

  describe '#surrounding_points' do
    subject { Advent::Point.new(0, 0) }
    it 'should return the surrounding coordinates' do
      expect(subject.surrounding_coordinates).to eq([
        [1, 0],
        [1, 1],
        [0, 1],
        [-1,1],
        [-1,0],
        [-1,-1],
        [0,-1],
        [1,-1],
      ].sort)
    end
  end
end
