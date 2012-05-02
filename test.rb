require 'rubygems'
require 'bundler/setup'
require 'capybara'
require 'capybara/dsl'

# sets up the testing environment
Capybara.default_driver = :selenium # use selenium with firefox
Capybara.app_host = 'http://en.wikipedia.org/' # the target site

include Capybara::DSL # adds the helpers

visit 'wiki/Main_Page'

puts "Visiting Main Page"

puts current_url

sleep 10
