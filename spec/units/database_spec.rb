describe 'Database class' do
  before(:all) do
    Database.init('chitter_test')
    Database.do_not_call_this_method_empty_the_database
  end

  it 'stores a given peep' do
    Database.peep('test peep')
    expect(Database.peeps[0].content).to eq 'test peep'
  end
end