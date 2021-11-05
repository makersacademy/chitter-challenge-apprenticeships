describe '.create' do
  it 'creates a new peep message' do
    PeepMessages.create(message: 'this is beep 2')
    expect(PeepMessages.all).to include 'this is beep 2'
  end
end