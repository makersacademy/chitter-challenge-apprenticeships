require 'peeps'
require 'pg'

describe 'Peeps' do
  let(:test) { Peeps.new }
  it 'can view all peeps' do
    setup_test_database
    add_row_to_test_database
    test1 = test.view_all
  expect(test1).to include("This is a peep!")
  end

  it 'can add a peep' do
    setup_test_database
    add_row_to_test_database
    test.add_tweet("This is another peep!")
    expect(test.view_all).to include("This is another peep!")
  end
end
