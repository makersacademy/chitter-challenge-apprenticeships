require 'peep'

describe Peep do
  let(:username) { double(:username) }
  let(:message) { double(:message) }

  it 'can add a peep' do
    peep = Peep.add(username: username, message: message)
    expect(peep.username).to eq username
    expect(peep.message).to eq message
  end

end
