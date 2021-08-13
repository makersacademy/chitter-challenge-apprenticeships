require 'pg'

class PeepManager
  def all
    if ENV["ENVIROMENT"] == 'test'
      con = PG.connect(:dbname => 'chitter_test', :user => 'mikey')
      messages = con.exec("SELECT message FROM peeps")
    else
      con = PG.connect(:dbname => 'chitter', :user => 'mikey')
      messages = con.exec("SELECT message FROM peeps")
    end
      return messages.map{|each| each}
  end
end