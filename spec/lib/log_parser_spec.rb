require 'rspec'
require_relative '../../lib/log_parser'
require_relative '../../types/page_view'

RSpec.describe LogParser do
  let(:log_file) { 'spec/fixtures/webserver.log' }
  let(:parser) { LogParser.new(log_file) }

  describe '#parse' do
    context 'with a valid log file' do
      before do
        allow(File).to receive(:foreach).with(log_file).and_yield("/home 192.168.0.1\n").and_yield("/about 10.0.0.1\n")
      end

      it 'parses the log file and returns an array of PageView structs' do
        page_views = parser.parse
        expect(page_views.length).to eq(2)
        expect(page_views).to all(be_a(PageView))
        expect(page_views.first.page).to eq('/home')
        expect(page_views.first.ip).to eq('192.168.0.1')
        expect(page_views.last.page).to eq('/about')
        expect(page_views.last.ip).to eq('10.0.0.1')
      end
    end

    context 'with an invalid log entry' do
      before do
        allow(File).to receive(:foreach).with(log_file).and_yield("/home invalid_ip\n").and_yield("/about 10.0.0.1\n")
      end

      it 'raises an ArgumentError when encountering an invalid entry' do
        expect { parser.parse }.to raise_error(ArgumentError, /Invalid IP address/)
      end
    end

    context 'with a log file containing empty lines or malformed entries' do
      before do
        allow(File).to receive(:foreach).with(log_file).and_yield("\n").and_yield("/home \n").and_yield("/about 10.0.0.1\n")
      end

      it 'raises an ArgumentError for malformed log entries' do
        expect { parser.parse }.to raise_error(ArgumentError)
      end
    end
  end
end
