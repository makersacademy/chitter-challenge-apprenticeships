require 'loader_storer'
require 'peep'

describe LoaderStorer do
  describe '#create' do
    it "stores a new peep in the database" do

    end
  end

  describe '#fetch' do
    it "'#fetch'es the peeps from the database as an array of Peep instances" do
      LoaderStorer.create(message: 'some peep', name: 'Testguy2', timestamp: Time.now.strftime("%d/%m/%Y %k%M"))
      
      expect(LoaderStorer.fetch[0]).to be_a(Peep)
    end
  end
end