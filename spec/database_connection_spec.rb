require 'database_connection'
require 'peep'
require 'database_helpers'

describe DatabaseConnection do
  describe '#create' do
    it "stores a new peep in the database" do
      peep = DatabaseConnection.create(message: "a peep", name: "tester", timestamp: Time.new.strftime("%d/%m/%Y %k%M"))

      persisted_data = persisted_data(id: peep.id)
      peeps = DatabaseConnection.fetch

      expect(peep.id).to eq persisted_data['id']
      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
    end
  end

  describe '#fetch' do
    it "'#fetch'es the peeps from the database as an array of Peep instances" do
      DatabaseConnection.create(message: 'some peep', name: 'Testguy2', timestamp: Time.new.strftime("%d/%m/%Y %k%M"))
      
      expect(DatabaseConnection.fetch[0]).to be_a(Peep)
    end
  end
end
