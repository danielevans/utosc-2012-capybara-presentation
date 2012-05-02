require 'rubygems'
require 'bundler/setup'
require 'capybara'
require 'capybara/dsl'

# sets up the testing environment
Capybara.default_driver = :selenium # use selenium with firefox
Capybara.app_host = 'http://en.wikipedia.org/' # the target site

include Capybara::DSL # adds the helpers

visit 'wiki/Main_Page'

fill_in "searchInput", :with => "capybara"

click_button "searchButton"

puts current_url

if page.has_content?("Hydrochoerus hydrochaeris")
  puts "the page has the rodent's scientific classification"
else
  throw "expectation failed: the page does not have the scientific classification of the capybara"
end

sleep 10
