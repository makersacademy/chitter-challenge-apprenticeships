describe '.all' do
  it 'returns a list of peeps' do
    peep = Peep.all

    expect(peep['message']).to include('This is a peep!')
    expect(peep['message']).to include('OMG loving these bangers!')
    
  end
end