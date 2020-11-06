require 'peeps'

describe Peeps do
  describe '.all' do
    it 'gives a list of all peeps' do
      peeps = Peeps.all

      expect(peeps).to include('The weather is very gloomy')
      expect(peeps).to include('Back in lockdown!')
      expect(peeps).to include('Hope everyone is happy!')
    end
  end
end
