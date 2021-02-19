require 'pg'
require 'spec/setup_database'

class Peep
  attr_reader :message, :date
# TODO take off all default dates when doing 3rd user story
  def initialize(message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      setup_test_database
    else
      setup_database
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], date: bookmark['date']) 
  end

  def self.create(message:, date: = '4/24/1996')
    if ENV['ENVIRONMENT'] == 'test'
      setup_test_database
    else
      setup_database
    end

    result = connection.exec("INSERT INTO peeps(message, date) VALUES('#{message}', '#{date}') RETURNING id, message, date;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end
end