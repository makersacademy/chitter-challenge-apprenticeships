require "chitter_messaging"
describe Chitter do
  describe "#all" do
    it "returns all the messages" do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")

 
      messages = ChitterMessage.all
 
      expect(messages).to eq (["This is a peep!"])
    end
  end

  describe "#post" do
    it "adds a new message to the database" do
      connection = PG.connect(dbname: 'chitter_test')
      ChitterMessage.post("Hello world")
      expect(ChitterMessage.all).to include "Hello world"
    end
  end
end
