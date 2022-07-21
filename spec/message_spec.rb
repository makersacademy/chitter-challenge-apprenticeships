require 'message'

RSpec.describe '.all' do
  context "so that I can see what people are doing" do
    it "#all displays all messages" do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('First message')")
      connection.exec("INSERT INTO peeps (message) VALUES ('Second message')")

      messages = Message.all

      expect(messages).to include "First message"
      expect(messages).to include "Second message"

    end
  end
end

RSpec.describe '.create' do
  context "so that I can create a new message" do
    it "#create adds a new message" do
      message = Message.create('Another message')
      expect(Message.all).to include "Another message"
    end
  end
end
