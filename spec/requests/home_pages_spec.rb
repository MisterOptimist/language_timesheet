require 'spec_helper'

describe "Home Page" do
  describe "GET /" do
    it "should contain all the proper links" do
      get root_path
      click_button "Timesheets"

      expect(response).to redirect_to(root_path)
    end
  end
end
