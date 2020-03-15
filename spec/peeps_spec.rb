require 'peeps'
require 'pg'

describe 'Peeps' do
  let(test) { Peeps.new }
  it 'can view all peeps' do
    expect(test.view_all).to include("This is a peep!")
  end
end
