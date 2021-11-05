require 'pg'

class PeepMessages
  attr_reader :message
  
  def initialize(message = '')
    @message = message
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

  end 

end 