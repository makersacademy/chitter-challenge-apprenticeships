require 'peeps_data'
require 'date'
TEST_PEEP = Peep.new('This is Peep', (Date.today - 3).strftime("%Y-%m-%d"))
TEST_POOP = Peep.new('This is Poop', (Date.today - 2).strftime("%Y-%m-%d"))
TEST_CHOCOLATE = Peep.new('chocolate', (Date.today - 1).strftime("%Y-%m-%d"))
describe PeepsData do

  it 'should add peep' do
    response = subject.add(TEST_PEEP)
    expect(response[0].message).to eq TEST_PEEP.message
    expect(response[0].date).to eq TEST_PEEP.date
  end
  it 'should add poop' do
    response = subject.add(TEST_POOP)
    expect(response[0].message).to eq TEST_POOP.message
    expect(response[0].date).to eq TEST_POOP.date
  end
  it 'should add chocolate' do
    response = subject.add(TEST_CHOCOLATE)
    expect(response[0].message).to eq TEST_CHOCOLATE.message
    expect(response[0].date).to eq TEST_CHOCOLATE.date
  end
  it 'should list Items' do
    response = subject.list
    expect(response[0].message).to eq TEST_CHOCOLATE.message
    expect(response[0].date).to eq TEST_CHOCOLATE.date
  end
  it 'should filter by keyword' do
    response = subject.list_by_keyword('is')
    expect(response).not_to include(TEST_CHOCOLATE)
    expect(response).not_to include(TEST_PEEP)
    expect(response).not_to include(TEST_POOP)
  end
end
