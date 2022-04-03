require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

         # Add the test data
        connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Hello world!', 3);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('Hi Chitter! This is my first peep!', 2);")
        connection.exec("INSERT INTO peeps (message, author_id) VALUES('This is a peep!', 3);")

        peeps = Peep.all

        expect(peeps.length).to eq 3
        expect(peeps.first).to be_a Peep
        expect(peeps.first.message).to eq 'Hello world!'
        expect(peeps.first.name).to eq 'Joe Blogg'
        expect(peeps.first.created_at).to eq Time.now.strftime("On %d-%m-%Y at %H:%M")
    end
  end

    describe '.own_peeps' do
    it 'posts a peep and returns all my peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message, author_id) VALUES ('Can''t believe it''s snowing in April!', 1);")

      peeps = Peep.own_peeps

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Can\'t believe it\'s snowing in April!'
      expect(peeps.first.name).to eq 'Laura Cab'
      expect(peeps.first.created_at).to eq Time.now.strftime("On %d-%m-%Y at %H:%M")
    end
  end

  describe '.post' do
    it 'creates a new peep' do
      peep = Peep.post(message: 'Oh! It\'s raining today! Where is my umbrella?', author_id: 1)
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.message).to eq 'Oh! It\'s raining today! Where is my umbrella?'
    end
  end
end

    