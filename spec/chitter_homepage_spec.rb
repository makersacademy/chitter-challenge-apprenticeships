require 'chitter_homepage'
require 'pg'

RSpec.describe Chitter_Page do
  describe '.view' do
    it "returns a list of peeps" do 
      connection = PG.connect(dbname: "chitter_test")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

      view_peeps = Chitter_Page.view
      time = Time.now.strftime("%Y-%m-%d")

      expect(view_peeps).to include ({:date_posted=>time, :message=>"This is a peep!"})
    end
  end

    describe '.create' do 
      it 'adds a new peep to chitter' do 
        peep = Chitter_Page.create("example peep")
        connection = PG.connect(dbname: "chitter_test").query("SELECT * FROM peeps;")
        expect(Chitter_Page.view).to_not be_nil
      end
    end

end