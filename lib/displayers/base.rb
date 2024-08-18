module Displayers
  class Base
    def initialize(page_views)
      @page_views = page_views
    end

    def display_table
      puts header
      puts "-" * 40
      puts "| Page           | #{header.split.first(2).join(' ')}   |"
      puts "-" * 40
      data.each do |page, count|
        puts "| #{page.ljust(14)} | #{count.to_s.ljust(14)} |"
      end
      puts "-" * 40
    end

    private

    attr_reader :page_views

    def header
      raise NotImplementedError, "You must implement the header method"
    end

    def data
      raise NotImplementedError, "You must implement the data method"
    end
  end
end
