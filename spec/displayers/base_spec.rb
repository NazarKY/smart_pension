require 'rspec'
require_relative '../../lib/displayers/base'
require_relative '../../types/page_view'

RSpec.describe Displayers::Base do
  let(:page_views) {
    [
      PageView.new('/home', '192.168.0.1'),
      PageView.new('/about', '192.168.0.2')
    ]
  }

  it 'raises NotImplementedError for header method' do
    expect { Displayers::Base.new(page_views).send(:header) }.to raise_error(NotImplementedError, /You must implement the header method/)
  end

  it 'raises NotImplementedError for data method' do
    expect { Displayers::Base.new(page_views).send(:data) }.to raise_error(NotImplementedError, /You must implement the data method/)
  end
end
