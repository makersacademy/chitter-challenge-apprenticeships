require 'peep'
require_relative './setup_test_database'

describe Peep do

before(:each) do
  setup_test_database
end

describe '.all' do
it 'returns a list of posts' do


        peep = Peep.all

    expect(peep).to include "This is message 1"
    expect(peep).to include "This is message 2"
    expect(peep).to include "hThis is message 3"
end
end

end
