describe 'Peep class' do
  it 'can be instantiated' do
    now = DateTime.now
    peep = Peep.new(12345, now, 'hello')
    expect(peep.id).to eq 12345
    expect(peep.created_at).to eq now
    expect(peep.content).to eq 'hello'
  end
end