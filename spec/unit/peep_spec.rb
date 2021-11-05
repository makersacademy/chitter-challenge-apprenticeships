require 'peep'

describe '.create' do
  it 'creates a new message' do
    Peep.create(message: 'Hi there')
  
    expect(Peep.all).to include 'Hi there'
  end
end
