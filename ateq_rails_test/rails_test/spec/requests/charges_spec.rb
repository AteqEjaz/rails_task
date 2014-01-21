require 'spec_helper'

describe "Charges" do
  describe "GET /charges" do
    it "should have the content 'Sample charges Lists'" do
      visit '/charges'
      expect(page).to have_selector('li', :text => "Failed Charges")
      expect(page).to have_selector('li', :text => "Disputed Charges")
      expect(page).to have_selector('li', :text => "Successfull Charges")
    end
  end
end


