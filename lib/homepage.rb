require 'pg'


class HomePage
  attr_reader :message, :date

  def initialize(message:, date:)
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      HomePage.new(message: peep['message'], date: peep['date'])
    end
  end
  def self.create(post)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{post}', '#{Time.now}');")
  end
end