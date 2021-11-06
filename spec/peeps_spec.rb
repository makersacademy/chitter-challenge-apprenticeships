require 'date'
require 'peeps'
require 'peep'
TEST_PEEP = Peep.new("test_message")
PEEP_LAST = Peep.new("test PEEP", "sept112")
PEEP_NEW = Peep.new("LAST PEEP", "sept11")

describe Peeps do
  it 'empty should report error' do
    expect { subject.list }.to raise_error 'Empty List'
  end
  it 'should add peep to list' do
    subject.add(TEST_PEEP)
    expect(subject.last_record).to eq TEST_PEEP
  end
  it 'should sort descending' do
    subject.add(TEST_PEEP)
    subject.add(PEEP_NEW)
    expect(subject.sort_descending[0]).to eq PEEP_NEW
  end
  it 'should filter by keyword' do
    subject.add(TEST_PEEP)
    subject.add(PEEP_NEW)
    subject.add(PEEP_LAST)
    expect(subject.filter("test")).to eq [PEEP_LAST, TEST_PEEP]
  end
  it 'check added should have today\'s date' do
    subject.add(TEST_PEEP)
    expect(subject.last_record.date).to eq Date.today
  end
end