describe '.create' do
  it 'adds a peep message' do
    Peeps.create(message: 'Hello Humans!')
    expect(Peeps.all).to include 'Hello Humans!'
  end 
end 
