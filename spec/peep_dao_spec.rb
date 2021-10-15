require 'peep_dao'

describe PeepDao do

  let(:peep) { double :peep }

  describe '#all' do
    it 'should return an array of Peep objects' do
      all_peeps = described_class.all
      expect(all_peeps.class).to eq(Array)
      all_peeps.each do |peep|
        expect(peep.class).to eq(Peep)
      end
    end
  end
end