require 'spec_helper'

describe Advent::Checksum do
  describe '#find_small_large' do
    subject { Advent::Checksum.new("1\t2\n1\t3") }

    it 'should return [1,9] from [5,1,9,5]' do
      expect(subject.find_small_large([5,1,9,5])).to eq([1,9])
    end

    it 'should return [3,7] from [7,5,3]' do
      expect(subject.find_small_large([7,5,3])).to eq([3,7])
    end

    it 'should return [2,8] from [2,4,6,8]' do
      expect(subject.find_small_large([2,4,6,8])).to eq([2,8])
    end
  end

  describe '.calculate' do
    context 'the provided spreadsheet' do
      it 'should calculate a checksum of 18' do
        subject = Advent::Checksum.new("1\t2\n1\t3")
        rows = [
          [5,1,9,5],
          [7,5,3],
          [2,4,6,8],
        ]

        subject.rows = rows
        expect(subject.accumulate(:find_small_large).sum).to eq(18)
      end
    end
  end

  describe '#parse_spreadsheet' do
    subject { Advent::Checksum.new("1\t2\n1\t3") }
    it 'should return an array of arrays of ints' do
      sample = <<~END
      737	1866	1565	1452	1908	1874	232	1928	201	241
      55	258	363	116	319	49	212	44	303	349	327
      END
      expected = [
        [737,1866,1565,1452,1908,1874,232,1928,201,241],
        [55,258,363,116,319,49,212,44,303,349,327],
      ]
      expect(subject.parse_spreadsheet(sample)).to eq(expected)
    end
  end
end
