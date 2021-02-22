require 'peeps_manager'

describe PeepsManager do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is a peep', '#{Time.new(2019, 06, 21)}')")
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is another peep', '#{Time.new(2020, 01, 02)}')")    
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('Yet another peep', '#{Time.new(2021, 02, 11)}')")
  
      peeps = PeepsManager.all

    expect(peeps).to include('This is a peep - 2019-06-21')
    expect(peeps).to include('This is another peep - 2020-01-02')
    expect(peeps).to include('Yet another peep - 2021-02-11')
    end
  end
  describe '.create' do
    it 'can add peeps with .create' do

      # Add the test data
      allow(Time).to receive(:now).and_return('2020-01-05') 
      PeepsManager.create('Mad new peep')

      peeps = PeepsManager.all

      expect(peeps).to include('Mad new peep - 2020-01-05' )
    end
  end
  describe '.create' do
    it 'returns a list of peeps that contain a word' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is a peep', '#{Time.new(2019, 06, 21)}')")
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is another peep', '#{Time.new(2020, 01, 02)}')")    
      connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('Yet another peep', '#{Time.new(2021, 02, 11)}')")
  
      peeps = PeepsManager.filter('another')

    expect(peeps).to_not include('This is a peep - 2019-06-21')
    expect(peeps).to include('This is another peep - 2020-01-02')
    expect(peeps).to include('Yet another peep - 2021-02-11')
    end
  end
end