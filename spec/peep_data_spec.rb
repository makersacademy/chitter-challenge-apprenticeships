require 'peeps_data'
require 'date'
describe PeepsData do
  TEST_PEEP = Peep.new('This is Peep', Date.today.strftime("%Y-%m-%d"))
  it 'should add peep' do
    response = subject.add(TEST_PEEP)
    expect(response[0].message).to eq TEST_PEEP.message
    expect(response[0].date).to eq TEST_PEEP.date

  end
  it 'should list Items' do
    response = subject.add(TEST_PEEP)
    expect(response[0].message).to eq TEST_PEEP.message
    expect(response[0].date).to eq TEST_PEEP.date
  end
end
