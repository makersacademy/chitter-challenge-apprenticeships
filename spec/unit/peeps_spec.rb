require 'peeps'

describe Peep do

  describe '#all' do
    it 'lists all the peeps' do
      peeps_list = Peep.all

      expect(peeps_list).to include "This is my first peep!"
      expect(peeps_list).to include "This is my second peep!"
      expect(peeps_list).to include "This is my third peep!"

    end
  end
  
end