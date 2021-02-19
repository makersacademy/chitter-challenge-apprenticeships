describe Peep do
  test_peep = Peep.new(user: 'Testguy', content: 'I love #testing', timestamp:, keywords:)
  describe "#init" do
    it "has a user associated with the peep" do
      expect(test_peep.user).to eq 'Testguy'
    end
  end
end