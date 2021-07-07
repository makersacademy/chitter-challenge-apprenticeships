require './lib/chitter'
require 'database_helpers_spec'

RSpec.describe Peep do
  describe '.all' do
    it 'shows all the chitter messages' do
      connection = PG.connect(dbname: 'chitter_test')

      #test data
      peep = Peep.create(message: "Hey, how are you?", date: "11/04/20")
      Peep.create(message: "Chitter is pretty cool!", date: "10/05/20")
      Peep.create(message: "I am really enjoying Makers!", date: "21/05/20")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.date).to eq '11/04/20'
      expect(peeps.first.message).to eq 'Hey, how are you?'
    end
  end


    describe '.create' do
      it 'posts a new message from a user' do
        peep = Peep.create(message: 'I am getting to grips with coding.', date: '21/05/20')
        persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

        expect(peep).to be_a Peep
        expect(peep.id).to eq persisted_data.first['id']
        expect(peep.date).to eq '21/05/20'
        expect(peep.message).to eq 'I am getting to grips with coding.'
      end
    end
  end
