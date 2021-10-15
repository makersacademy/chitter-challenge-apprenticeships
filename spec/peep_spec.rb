require 'peep'

describe Peep do

  describe '#all' do
    it 'returns empty array if have no messages' do
      expect(Peep.all).to eq []
    end

    it 'shows newest peeps first' do
      Peep.create(msg: 'peep 1')
      sleep(1)
      Peep.create(msg: 'peep 2')
      sleep(1)
      Peep.create(msg: 'peep 3')
      
      peep_msgs = Peep.all.map { |peep| peep.msg }
      expect(peep_msgs).to eq ['peep 3', 'peep 2', 'peep 1']
    end
  end

  describe '#create' do
    it 'adds a new peep to the database' do
      Peep.create(msg: 'Owls are owlsome!')
      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps[0]).to be_instance_of Peep
      expect(peeps[0].msg).to eq 'Owls are owlsome!'
    end
  end
end
