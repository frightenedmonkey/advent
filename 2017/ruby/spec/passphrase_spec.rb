require 'spec_helper'

describe Advent::Passphrase do
  it 'should return true if a passphrase is valid' do
    expect(subject.valid?('aa bb cc dd ee')).to be true
    expect(subject.valid?('aa bb cc dd aaa')).to be true
  end

  it 'should return false if a passphrase is invalid' do
    expect(subject.valid?('aa bb cc dd aa')).to be false
  end

  it 'should return true if no phrase is an anagram' do
    expect(subject.anagram_valid?('abcde fghij')).to be true
    expect(subject.anagram_valid?('a ab abc abd abf abj')).to be true
    expect(subject.anagram_valid?('iiii oiii ooii oooi oooo')).to be true
  end

  it 'should return false if any phrase is an anagram of another' do
    expect(subject.anagram_valid?('abcde xyz ecdab')).to be false
    expect(subject.anagram_valid?('oiii ioii iioi iiio')).to be false
  end

  describe '#anagram?' do
    context 'oiii ioii' do
      it 'should return true' do
        expect(subject.anagram?('oiii', 'ioii')).to be true
      end
    end
  end
end
