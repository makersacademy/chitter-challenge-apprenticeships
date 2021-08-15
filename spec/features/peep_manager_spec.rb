require "peep_manager"
require 'date'

describe PeepManager do
  before do
    @manager = PeepManager.new
  end

  it { is_expected.to respond_to(:all) }

  describe '#all' do
    it "should return a list of all peeps stored in the database" do
      expect(@manager.all[0]["message"]).to(eq("This is a test peep"))
    end
  end

  describe '#add' do

    before do
      #@manager = PeepManager.new
      @manager.add("This is a test peep")
    end

    it "should add an entry to the test database" do
      expect(@manager.all[1]["message"]).to(eq("This is a test peep"))
    end

    it "should record the date that the peep was added to the test database" do
      expect(@manager.all[0]["date"]).to(eq(PeepTime.now))
    end
  end

end
