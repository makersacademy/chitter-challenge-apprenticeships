require 'peep'

describe Peep do
  it 'responds to method .all' do
    expect(Peep).to respond_to(:all)
  end
  it 'responds to method .create' do
    expect(Peep).to respond_to(:create)
  end
end
