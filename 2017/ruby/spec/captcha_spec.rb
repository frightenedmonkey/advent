require 'spec_helper'

describe Captcha do
  subject { Captcha.new }

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
      expect(subject.sequentially_awesome([1,1,2,2])).to eq([1,2])
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
end

