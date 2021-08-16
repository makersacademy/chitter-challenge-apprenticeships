require 'pg'
#require_relative "../spec/spec_helper.rb"
require_relative './timepeep.rb'

class PeepManager

  def initialize
    #if ENV["ENVIRONMENT"] == "test" 
    @db = 'chitter_test'
    #else
    #@db = 'chitter'
  #end

    @con = PG.connect(:dbname => @db, :user => 'mikey')
  end

  def all
    return @con.exec("SELECT message, date FROM peeps;").map{|each| each}
  end

  def add(peep)
    @con.exec("INSERT INTO peeps (message, date) VALUES ('#{peep}', '#{PeepTime.now}');")
  end
end