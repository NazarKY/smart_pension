require 'rspec'
require_relative '../../types/page_view'

RSpec.describe PageView do
  describe '#initialize' do
    context 'with valid input' do
      it 'creates a PageView instance with a valid page and IP' do
        page_view = PageView.new('/home', '192.168.0.1')
        expect(page_view.page).to eq('/home')
        expect(page_view.ip).to eq('192.168.0.1')
      end
    end

    context 'with invalid page input' do
      it 'raises an ArgumentError for an empty page string' do
        expect { PageView.new('', '192.168.0.1') }.to raise_error(ArgumentError, /Invalid page/)
      end

      it 'raises an ArgumentError for a non-string page input' do
        expect { PageView.new(nil, '192.168.0.1') }.to raise_error(ArgumentError, /Invalid page/)
      end
    end

    context 'with invalid IP input' do
      it 'raises an ArgumentError for an invalid IP address' do
        expect { PageView.new('/home', 'invalid_ip') }.to raise_error(ArgumentError, /Invalid IP address/)
      end

      it 'raises an ArgumentError for an empty IP string' do
        expect { PageView.new('/home', '') }.to raise_error(ArgumentError, /Invalid IP address/)
      end
    end
  end
end
