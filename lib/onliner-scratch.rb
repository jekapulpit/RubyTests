require './scratcher'
require './CSVwriter'

scratcher = Scratcher.new
scratcher.go_to_main_page
CSVwriter.new("data.csv").write_info(scratcher.get_all_news(scratcher.get_ids_in_class("b-tile"))
)
