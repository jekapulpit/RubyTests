require './scratcher'
require './csv_writer'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver = :selenium
end
scratcher = Scratcher.new(Capybara.current_session)
scratcher.go_to_main_page
CSVwriter
  .new('data.csv')
  .write_info(scratcher.get_all_news(scratcher.get_ids_in_class('b-tile')))
