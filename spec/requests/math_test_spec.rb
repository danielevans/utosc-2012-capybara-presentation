require 'spec_helper'
describe "Math Test" do
  before(:all) do
    Capybara.app_host = 'http://scriptar.com/'
  end
  
  it "congratulates me" do
    visit 'JavaScript/MathTest/'
    page.all(".add").each do |add_node|
      within(add_node) do
        add_node.find("input").set (find(".n1").text.to_i + find(".n2").text.to_i).to_s
      end
    end

    page.all(".mul").each do |add_node|
      within(add_node) do
        add_node.find("input").set (find(".n1").text.to_i * find(".n2").text.to_i).to_s
      end
    end

    page.all(".sub").each do |add_node|
      within(add_node) do
        add_node.find("input").set (find(".n1").text.to_i - find(".n2").text.to_i).to_s
      end
    end

    page.execute_script "window.alert = function(arg) { gAlertArgs = arg };"
    click_button "Grade Test"

    page.execute_script("return gAlertArgs;").should match(/Correct: 100/)
  end
end
