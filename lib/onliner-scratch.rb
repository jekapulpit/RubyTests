require 'nokogiri'
require 'capybara'
require 'RSpec'
require 'csv'

# Configurations
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end
browser = Capybara.current_session
driver = browser.driver.browser
browser.visit "https://www.onliner.by/"


classes = browser.execute_script(
    " var m = document.getElementsByClassName('b-tile');
            var t = []

            for (index = 0; index < m.length; ++index) {
              t.push(m[index].id);
            }
            return t;
    ",
).find_all{ |elem| elem != "" }
CSV.open("data.csv", "w", encoding: "UTF-8") do |wr|
  classes.each do |el|
    browser.find('#' + el).click
    wr << [
            browser.find('.news-header__title > div').text,
            browser.find('.news-header__image').native.css_value('background-image').slice(5..-3),
            browser.find('.news-entry__speech').text.slice(0..199)
          ]
    browser.visit 'https://www.onliner.by/'
  end
end
