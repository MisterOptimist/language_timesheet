require 'spec_helper'

describe Word do
  it "is valid with english,khmer,khmersentence,phonetic,englishphonetic" do
  word = Word.new(
  	english: 'hello',
  	khmer: 'suasdaye',
  	khmersentence: 'khmersentencekhmersentence',
  	phonetic: 'Suasdaye bong piup',
  	english_phonetic: 'Thisistheanswer')
  	expect(word).to be_valid
  end

  it "is invalid without a english word" do
  	expect(Word.new(english: nil)).to have(1).errors_on(:english)
  end

  it "is invalid without a khmer word" do
  	expect(Word.new(khmer: nil)).to have(1).errors_on(:khmer)
  end

end
