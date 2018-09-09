require 'spec_helper'

describe Advent::Passphrase do
  it 'should return true if a passphrase is valid' do
    expect(subject.valid?('aa bb cc dd ee')).to be true
    expect(subject.valid?('aa bb cc dd aaa')).to be true
  end

  it 'should return false if a passphrase is invalid' do
    expect(subject.valid?('aa bb cc dd aa')).to be false
  end
end
