require 'spec_helper'

describe Advent::Jumps do
  subject { Advent::Jumps.new([0,1,2,3]) }
  it 'should initialize do' do
    expect(subject).to_not be_nil
  end

  describe '#jump!' do
    it 'should increment an offset when it jumps from the location' do
      subject.jump!
      expect(subject.offsets).to eq([1,1,2,3])
    end

    it 'should add to the number of steps' do
      subject.jump!
      expect(subject.steps).to eq(1)
      subject.jump!
      expect(subject.steps).to eq(2)
    end
  end

  describe '#next_location_valid?' do
    context 'when the next location is a valid index location' do
      it 'should return true' do
        expect(subject.next_location_valid?(0)).to be true
      end
    end
    context 'the next move exits the maze' do
      subject { Advent::Jumps.new([20,0,2]) }
      it 'should return false' do
        expect(subject.next_location_valid?(20)).to be false
      end
    end
  end

  describe '#move_until_exit' do
    subject { Advent::Jumps.new([0,3,0,1,-3]) }
    it 'should take 5 steps to exit' do
      subject.move_until_exit
      expect(subject.steps).to eq 5
    end
  end
end
