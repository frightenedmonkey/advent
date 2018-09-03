require 'spec_helper'

describe Advent::Spiral do
  describe '#size_board' do
    it 'should return the next odd integer up of the square root of the input' do
      expect(subject.size_board(9)).to eq(3)
      expect(subject.size_board(10)).to eq(5)
    end
  end
end
