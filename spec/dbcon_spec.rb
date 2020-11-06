require_relative '../lib/dbcon'

describe DatabaseConnection do
  subject { described_class }

  describe "#setup" do
    it "sets up a connection to a database" do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      subject.setup('chitter_test')
    end
  end

  describe ".conn" do
    it "is an instance of PG" do
      connection = subject.setup('chitter_test')
      expect(subject.conn).to eq connection
    end
  end

  describe "#query" do
    it "is queries what's been asked for" do
      subject.setup('chitter_test')
      expect(subject.conn).to receive(:exec).with('SELECT * FROM peeps;')
      subject.query('SELECT * FROM peeps;')
    end
  end
end 
