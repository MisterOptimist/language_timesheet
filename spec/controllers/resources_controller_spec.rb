require 'spec_helper'

describe ResourcesController do

  describe "GET 'khmerfont'" do
    it "returns http success" do
      get 'khmerfont'
      response.should be_success
    end
  end

  describe "GET 'anki'" do
    it "returns http success" do
      get 'anki'
      response.should be_success
    end
  end

  describe "GET 'goals'" do
    it "returns http success" do
      get 'goals'
      response.should be_success
    end
  end

end
