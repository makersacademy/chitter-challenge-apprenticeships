require 'Peeps'
require 'database_helpers'

describe Peeps do
  describe '.all' do
    it 'returns all chitter posts' do
      connection = PG.connect(dbname: 'chitter_test')
      time_when_tested = "2022-07-15 12:00:15"
      peep = Peeps.create(peep: "Hello this is my unit test for .all", time: time_when_tested)
      Peeps.create(peep: "Hello this another peep from my unit test", time: time_when_tested)
      peeps = Peeps.all

    end
  end

  describe '.create' do
    it 'creates a new peep' do
      time_when_tested2 = "2022-07-15 19:05:11"
      peep = Peeps.create(peep: 'This is a test peep!', time: time_when_tested2)
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peeps
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'This is a test peep!'
      expect(peep.time).to eq time_when_tested2
    end
  end

  describe '.sort_by_time' do
    it 'Sorts the posts by date/time in ascending order' do
      first_post_time = "2022-07-15 19:05:11"
      second_post_time = "2022-07-18 11:30:11"
      peep = Peeps.create(peep: 'This is the first sort by time test peep!', time: first_post_time)
      Peeps.create(peep: 'This is the second sort by time test peep!', time: second_post_time)
      peeps = Peeps.sort_by_time
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.peep).to eq "This is the second sort by time test peep!"
      expect(peeps.first.time).to eq second_post_time
    end
  end

  describe '.search_by_keyword' do
    it "Returns posts that contain the keyword provided" do
      peep = Peeps.create(peep: 'This is the first sort by time test peep!', time: Time.new)
      Peeps.create(peep: 'This is the second sort by time test peep!', time: Time.new)
      Peeps.create(peep: 'Some other rubbish!', time: Time.new)
      Peeps.create(peep: 'Yet more rubbish!', time: Time.new)
      Peeps.create(peep: 'And one more for good measure!', time: Time.new)
      peeps = Peeps.search_by_keyword("rubbish")
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.peep).to eq "Some other rubbish!"
    end
  end
end
