require 'pg'

class DatabaseConnection
  attr_accessor :host, :name, :user

  @@host = String('0.0.0.0')
  @@name = String('chitter')
  @@port = String('5432')
  @@con = nil

  def self.set_name(new_name)
    @@name = new_name
  end

  def self.open
    @@con = PG::Connection.new(host: @@host, dbname: @@name, port: @@port)
  end

  def self.close
    @@con.close
    @@con = nil
  end

  def self.query(q)
    open
    r = @@con.exec(q)
    close
    r
  end
end
