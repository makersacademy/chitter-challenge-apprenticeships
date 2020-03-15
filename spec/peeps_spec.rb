require 'peeps'
require 'pg'

describe 'Peeps' do
  let(:test) { Peeps.new }
  it 'can view all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    test1 = test.view_all
    expect(test1).to include("This is a peep!")
  end
end
