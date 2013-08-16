require 'spec_helper'

describe "words/new" do
  before(:each) do
    assign(:word, stub_model(Word,
      :khmer => "MyString",
      :english => "MyString"
    ).as_new_record)
  end

  it "renders new word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", words_path, "post" do
      assert_select "input#word_khmer[name=?]", "word[khmer]"
      assert_select "input#word_english[name=?]", "word[english]"
    end
  end
end
