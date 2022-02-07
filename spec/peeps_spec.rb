require 'peeps'

describe Peeps do

  subject(:chitter) { described_class }

  before do 
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
  end

  describe "all" do 
    it 'displays all the posts' do
      peeps = chitter.all
      expect(peeps.first.message).to include ('This is a peep!')
    end
  end

  describe 'new_peep' do
    it 'can create a new peep' do
      chitter.new_peep(message:'This is a new rspec peep!')
      peeps = chitter.all
      expect(peeps.last.message).to eq('This is a new rspec peep!')
    end
  end

    describe 'search' do 
      it 'can filter results to serach' do
        chitter.new_peep(message:'irb for search test')
        chitter.new_peep(message:'irb for search test 2')

        search_results = chitter.search(search:'irb')
        expect(search_results.length).to eq 2
      end

    end

end