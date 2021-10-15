require 'services/peep_service'

describe PeepService do
  let(:peep_repository) { double :peep_repository }
  let(:peep1) { double :peep1 }
  let(:peep2) { double :peep2 }
  let(:peep3) { double :peep3 }

  let(:subject) { described_class.new(peep_repository) }

  describe '#all_peeps' do
    it 'returns an array of all peeps' do
      expected = [peep1, peep2, peep3]
      expect(peep_repository).to receive(:find_all_peeps).and_return(expected)
      expect(subject.find_all_peeps).to eq expected
    end
  end

  describe '#find_all_peeps_with_filter' do
    it 'returns an array of peeps with a keyword' do
      expected = [peep1, peep2, peep3]
      filter = "filter"
      expect(peep_repository).to receive(:find_all_peeps_with_filter).with(filter).and_return(expected)
      expect(subject.find_all_peeps_with_filter(filter)).to eq expected
    end
  end

  describe '#post_peep' do
    it 'sends a new peep to be added to the database' do
      expect(peep_repository).to receive(:add_peep).with(peep1)
      subject.post_peep(peep1)
    end
  end


end
