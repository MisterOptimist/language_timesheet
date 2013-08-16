require 'spec_helper'

describe "Home Page" do
  describe "GET /" do
    it "should contain all the proper links" do
      get root_path
      visit "Timesheets"

      expect(response).to redirect_to(@user, timesheets)
    end
  end
end