require "chitter_messaging"
describe Chitter do
  describe "#all" do
    it "returns all the messages" do    
      ChitterMessage.post("This is a peep!")
      expect(ChitterMessage.all).to eq (["This is a peep!"])
    end
  end

  describe "#post" do
    it "adds a new message to the database" do
      ChitterMessage.post("Hello world")
      expect(ChitterMessage.all).to include "Hello world"
    end
  end
end
