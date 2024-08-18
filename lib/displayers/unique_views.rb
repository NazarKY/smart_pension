require_relative './base'

module Displayers
  class UniqueViews < Base
    private

    def header
      'Unique views (Most to Least):'
    end

    def data
      unique_views = Hash.new { |hash, key| hash[key] = Set.new }

      page_views.each do |view|
        unique_views[view.page].add(view.ip)
      end

      unique_views.transform_values(&:size)
                  .sort_by { |_, count| -count }
    end
  end
end
