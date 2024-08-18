require 'rspec'
require 'set'
require_relative '../../lib/displayers/unique_views'
require_relative '../../types/page_view'

RSpec.describe Displayers::UniqueViews do
  let(:page_views) {
    [
      PageView.new('/home', '192.168.0.1'),
      PageView.new('/home', '192.168.0.1'),
      PageView.new('/about', '192.168.0.2'),
      PageView.new('/about', '192.168.0.3')
    ]
  }
  let(:display) { Displayers::UniqueViews.new(page_views) }

  it 'returns correct header' do
    expect(display.send(:header)).to eq('Unique views (Most to Least):')
  end

  it 'calculates and sorts unique views correctly' do
    expect(display.send(:data)).to eq([['/about', 2], ['/home', 1]])
  end

  it 'displays the table correctly' do
    expect { display.display_table }.to output(
                                          <<~OUTPUT
      Unique views (Most to Least):
      ----------------------------------------
      | Page           | Unique views   |
      ----------------------------------------
      | /about         | 2              |
      | /home          | 1              |
      ----------------------------------------
      OUTPUT
                                        ).to_stdout
  end
end
