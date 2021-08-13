require "peep_manager"

describe PeepManager do
  it { is_expected.to respond_to(:all) }

  describe '#all' do
    it "should return a list of all peeps stored in the database" do
      manager = PeepManager.new()
      expect(manager.all[0]["message"]).to(eq("This is a peep!"))
    end
  end
end
