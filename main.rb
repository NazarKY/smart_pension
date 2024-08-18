require_relative 'lib/log_parser'
require_relative 'lib/displayers/page_views'
require_relative 'lib/displayers/unique_views'

# Running the parser
if ARGV.size != 1
  puts "Usage: ruby main.rb data/webserver.log"
  exit
end

log_file = ARGV[0]
page_views = LogParser.new(log_file).parse

displayers = [
  Displayers::PageViews.new(page_views),
  Displayers::UniqueViews.new(page_views)
]

displayers.each(&:display_table)
