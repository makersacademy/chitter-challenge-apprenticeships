require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      bookmarks = Peep.all

      expect(bookmarks).to include("This is a peep!")
    end
  end
end