require 'spec_helper'

describe "words/edit" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
      :khmer => "MyString",
      :english => "MyString"
    ))
  end

  it "renders the edit word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", word_path(@word), "post" do
      assert_select "input#word_khmer[name=?]", "word[khmer]"
      assert_select "input#word_english[name=?]", "word[english]"
    end
  end
end
