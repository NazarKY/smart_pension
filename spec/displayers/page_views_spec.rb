require 'rspec'
require_relative '../../lib/displayers/page_views'
require_relative '../../types/page_view'

RSpec.describe Displayers::PageViews do
  let(:page_views) {
    [
      PageView.new('/home', '192.168.0.1'),
      PageView.new('/home', '192.168.0.2'),
      PageView.new('/about', '192.168.0.1')
    ]
  }
  let(:display) { Displayers::PageViews.new(page_views) }

  it 'returns correct header' do
    expect(display.send(:header)).to eq('Page views (Most to Least):')
  end

  it 'calculates and sorts page views correctly' do
    expect(display.send(:data)).to eq([['/home', 2], ['/about', 1]])
  end

  it 'displays the table correctly' do
    expect { display.display_table }.to output(
                                          <<~OUTPUT
      Page views (Most to Least):
      ----------------------------------------
      | Page           | Page views   |
      ----------------------------------------
      | /home          | 2              |
      | /about         | 1              |
      ----------------------------------------
      OUTPUT
                                        ).to_stdout
  end
end
