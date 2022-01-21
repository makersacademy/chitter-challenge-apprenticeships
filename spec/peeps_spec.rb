require 'peeps'

describe Peeps do

  subject(:chitter) { described_class }

  before do 
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
  end

  describe "all" do 
    it 'displays all the posts' do
      expect(chitter.all).to include ('This is a peep!')
    end

  end

end