require "peep"

describe Peep do
  describe ".view" do
    it "returns all messages" do
      peeps = Peep.view

      expect(peeps).to include "Hello world!"
      expect(peeps).to include "How you doin?"
      expect(peeps).to include "Like a glooooove."
    end
  end
end
