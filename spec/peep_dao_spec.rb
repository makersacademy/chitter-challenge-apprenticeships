require 'peep_dao'

describe PeepDao do

  let(:peep) { double :peep }
  let(:time_now) { Time.now }

  describe '#all' do
    it 'should return an array of Peep objects' do
      all_peeps = described_class.all
      expect(all_peeps.class).to eq(Array)
      all_peeps.each do |peep|
        expect(peep.class).to eq(Peep)
      end
    end
  end

  describe '#create' do
    it 'should add a new record to peeps table' do
      allow(peep).to receive(:message).and_return("message")
      allow(peep).to receive(:date).and_return(time_now)
      
      expect{described_class.create(peep)}.to change{described_class.all.length}.from(1).to(2)
      expect(described_class.all[1].message).to eq("message")
      expect(described_class.all[1].date).to eq(time_now.to_s)
    end
  end

  describe '#all_reverse_time_order' do
    it 'should return an array with the most recent posted peep first' do
      allow(peep).to receive(:message).and_return("message")
      allow(peep).to receive(:date).and_return(time_now + 100) ## adds 100 seconds to date of new post to make sure it is later

      described_class.create(peep)
      expect(described_class.all[0].message).to_not eq("message")
      expect(described_class.all_reverse_time_order[0].message).to eq("message")
    end
  end
end