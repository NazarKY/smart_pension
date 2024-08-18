require_relative './base'

module Displayers
  class PageViews < Base
    private

    def header
      'Page views (Most to Least):'
    end

    def data
      views_counts = page_views.each_with_object(Hash.new(0)) do |view, result|
        result[view.page] += 1
      end

      views_counts.sort_by { |_, count| -count }
    end
  end
end
