require 'pg'
require './spec/setup_database'

class Peep
  attr_reader :id, :message
# TODO take off all default dates when doing 3rd user story
  def initialize(id:, message:)
    @id = id
    @message = message 
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      setup_test_database
    else
      setup_database
    end 

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message']) 
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      setup_test_database
    else
      setup_database
    end

    # result = 
    connection.exec("INSERT INTO peeps(message) VALUES('#{message}') RETURNING id, message;")
    # Peep.new(id: result[0]['id'], message: result[0]['message'])
  end
end
