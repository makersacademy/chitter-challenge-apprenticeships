require 'peeps'
require 'peep'
TEST_PEEP = Peep.new("test_message")
describe Peeps do
  it 'empty should report error' do
    expect { subject.list }.to raise_error 'Empty List'
  end
  it 'should add peep to list' do
    subject.add(TEST_PEEP)
    expect(subject.last_record).to eq TEST_PEEP
  end

end
