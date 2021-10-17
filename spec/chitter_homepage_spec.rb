require 'chitter_homepage'
require 'pg'

RSpec.describe Chitter_Page do
  describe '.view' do
    it "returns a list of peeps" do 
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message, message_date) VALUES ('This is a peep!', '10-10-2021');")

      view_peeps = Chitter_Page.view

      expect(view_peeps).to include ({:message=>"This is a peep!", :message_date=>"10-10-2021"})
    end
  end

  # describe '.date' do 
  #   it 'add current time to table' do 

  #     # connection = PG.connect(dbname: "chitter_test")

  #     testing_time = Chitter_Page.date
  #     # connection.exec("INSERT INTO peeps (message_date) VALUES (#{testing_time});")
  #     # result = connection.exec("SELECT message_date FROM Peeps;")
  #     expect(testing_time).to include testing_time
  #   end
  # end

end