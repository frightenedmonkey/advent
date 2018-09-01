require 'spec_helper'

describe Advent::Captcha do
  subject { Advent::Captcha.new }

  # the #calculate_captcha method is essentially the main method that actually
  # returns the captcha output as described in https://adventofcode.com/2017/day/1
  #
  # This describe block is the set of tests for the captcha
  describe '#calculate_captcha' do
    it 'should return 3 from 1122' do
      expect(subject.calculate_captcha(1122)).to eq(3)
    end

    it 'should return 4 from 1111' do
      expect(subject.calculate_captcha(1111)).to eq(4)
    end

    it 'should return 0 from 1234' do
      expect(subject.calculate_captcha(1234)).to eq(0)
    end

    it 'should return 9 from 91212129' do
      expect(subject.calculate_captcha(91212129)).to eq(9)
    end
  end


  describe 'Advent::Captcha#calculate' do
    it 'should raise an InvalidInputError when not given an Integer' do
      expect { subject.calculate('banana') }.to raise_error(Advent::InvalidInputError)
    end
  end
end

describe Advent::CaptchaCalculator do
  describe '#uniquify!' do
    context 'the digits are [1,2,3,4]' do
      subject { Advent::CaptchaCalculator.new([1,2,3,4])}

      it 'should return an empty array' do
        subject.uniquify!
        expect(subject.accumulator).to eq([])
      end
    end
    context 'the digits are [1,1,2,2]' do
      subject { Advent::CaptchaCalculator.new([1,1,2,2])}
      it 'should return [1,1,2,2] from 1122' do
        subject.uniquify!
        expect(subject.accumulator.sort).to eq([1,2])
      end
    end
  end

  describe '#sum' do
    context 'the accumulator is an empty array' do
      subject { Advent::CaptchaCalculator.new([]) }
      it 'the sum should be 0' do
        expect(subject.sum).to eq(0)
      end
    end
    context 'the accumulator is [1,2]' do
      subject { Advent::CaptchaCalculator.new([]).accumulator = [1,2] }
      it 'the sum should be 3' do
        expect(subject.sum).to eq(3)
      end
    end
  end
end

