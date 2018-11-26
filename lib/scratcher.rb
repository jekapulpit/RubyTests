require 'nokogiri'
require 'capybara'
require 'RSpec'

class Scratcher
  def initialize
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, browser: :chrome)
    end
    Capybara.javascript_driver = :chrome
    Capybara.configure do |config|
      config.default_max_wait_time = 10 # seconds
      config.default_driver = :selenium
    end
    @browser = Capybara.current_session
    driver = @browser.driver.browser
  end
  def go_to_main_page
    @browser.visit "https://www.onliner.by/"
  end
  def get_ids_in_class(class_name)
    @browser.execute_script(
        " var m = document.getElementsByClassName('#{class_name}');
            var t = []

            for (index = 0; index < m.length; ++index) {
              t.push(m[index].id);
            }
            return t;",
        ).find_all{ |elem| elem != "" }
  end
  def get_all_news(id_list)
    news = []
    id_list.each do |id|
      self.go_to_page(id)
      begin
      news << [
            @browser.find('.news-header__title > div').text,
            @browser.find('.news-header__image').native.css_value('background-image').slice(5..-3),
            @browser.find('.news-entry__speech').text.slice(0..199)
      ]
      rescue
        puts 'oops'
      end
      self.go_to_main_page
    end
    news
  end
  def go_to_page(id)
    @browser.find('#' + id).click
  end
end

class CSVwriter
  def initialize(filename)
    @filename = filename
  end
  def write_info(info)
    CSV.open(@filename, "w", encoding: "UTF-8") do |wr|
      info.each do |inf_block|
        wr << inf_block
      end
    end
  end
end
