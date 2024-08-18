require_relative '../types/page_view'

class LogParser
  def initialize(log_file)
    @log_file = log_file
  end

  def parse
    page_views = []

    File.foreach(log_file) do |line|
      page, ip = line.split
      page_views << PageView.new(page, ip)
    end

    page_views
  end

  private

  attr_reader :log_file
end
