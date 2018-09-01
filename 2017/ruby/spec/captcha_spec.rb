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

  describe 'Advent#sequentially_awesome' do
    it 'should return [] from 1234' do
      expect(subject.sequentially_awesome([1,2,3,4])).to eq([])
    end
    it 'should return [1,1,2,2] from 1122' do
      expect(subject.sequentially_awesome([1,1,2,2]).sort).to eq([1,2].sort)
    end
  end

  describe 'Advent#captcha_sum' do
    it 'should return 0 from []' do
      expect(subject.captcha_sum([])).to eq(0)
    end
    it 'should return 3 from [1,2]' do
      expect(subject.captcha_sum([1,2])).to eq(3)
    end
  end

  describe 'Advent::Captcha#calculate' do
    it 'should raise an InvalidInputError when not given an Integer' do
      expect { subject.calculate('banana') }.to raise_error(Advent::InvalidInputError)
    end
  end
end

