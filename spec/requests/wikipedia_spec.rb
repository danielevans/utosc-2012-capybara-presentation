require 'spec_helper'
describe "en.wikipedia.org" do
  before(:all) do
    Capybara.app_host = 'http://en.wikipedia.org/'
  end
  
  before(:each) do
    visit 'wiki/Main_Page'
  end

  it "has a random article link" do
    page.should have_link("Random article")
  end

  it "should have a search field" do
    page.should have_field("searchInput")
  end

  it "should go to the capybara page when the exact search term matches" do
    fill_in "searchInput", :with => "capybara"
    click_button "searchButton"

    current_path.should == "/wiki/Capybara"
  end

  describe "wiki/Capybara" do
    it "contains the capybara's scientific classification" do
      visit "wiki/Capybara"
      page.should have_content("Hydrochoerus hydrochaeris")
    end
  end
end
