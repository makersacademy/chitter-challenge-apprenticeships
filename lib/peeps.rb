require 'pg'

class Peeps

  attr_accessor :peep_text, :peep_date

  def initialize(peep_text:, peep_date:)
    @peep_text = peep_text
    @peep_date = peep_date
  end 

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 
    
    all_entries = con.exec('SELECT message, peep_date FROM peeps;')

    all_entries.map do |peep| 
      Peeps.new(peep_text: peep['message'], peep_date: peep['peep_date']) 
    end

  end 

  def self.new_peep(peep_text:)
    peep_date = Time.new.strftime("%Y-%m-%d")

     if ENV['ENVIRONMENT'] == 'test' #Look into how to DRY this out
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO peeps (message, peep_date) VALUES('#{peep_text}','#{peep_date}')") #Value or valueS ?    
  end 
end 