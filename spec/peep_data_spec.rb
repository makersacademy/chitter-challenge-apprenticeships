require 'peeps_data'
require 'date'
describe PeepsData do
  TEST_PEEP = Peep.new('This is Peep', Date.today.strftime("%m/%d/%Y"))
  # it 'should list Items' do
  #   expect(subject.list).to eq [TEST_PEEP]
  # end
  # it 'should add peep' do
  #   expect(subject.add(Peep.new(TEST_PEEP))).to eq [TEST_PEEP]
  # end
end
