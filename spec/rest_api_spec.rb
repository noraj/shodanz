require "spec_helper"

RSpec.describe Shodanz::API::REST do
  before do
    @client = Shodanz.api.rest.new
  end

  describe '.info' do
    def check
      if Async::Task.current?
        resp = @client.info.result
      else
        resp = @client.info
      end
      expect(resp).to be_a(Hash)
    end

    context 'syncronously' do
      it 'returns info about the underlying token' do
        check
      end
    end

    context 'asyncronously' do
      it 'returns info about the underlying token' do
        Async do
          check
        end
      end
    end
  end


end
