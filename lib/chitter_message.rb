require 'pg'
require 'date'

class Chitter_message

  def self.save_message(message)
    db_connection.exec("INSERT INTO peeps (message) VALUES ('#{message}');")
  end

  def self.all(reversed, filter_keyword)
    if filter_keyword != "" 
      sql_filter = "WHERE message ILIKE '%#{filter_keyword}%'"
    else
      sql_filter = ""
    end

    if reversed == "true"
      array = db_connection.exec("SELECT * FROM peeps #{sql_filter} ORDER BY id DESC;")
      result = array.map { |x| "<div id='chitter_message'>A Chitter has said: <br><br> #{x['message']} <br><br><div id='alignleft'>#{format_time_date(x['date_time'])} </div><br></div>"}
    else
      array = db_connection.exec("SELECT * FROM peeps #{sql_filter};")
      result = array.map { |x| "<div id='chitter_message'>A Chitter has said: <br><br> #{x['message']} <br><br><div id='alignleft'>#{format_time_date(x['date_time'])} </div><br></div>"}
    end
    return result.join("<br>")
  end

  def self.reverse_list(reversed)
    if reversed == "true" 
      return "<a href='/'>Reverse the list?</a>"
    else
      return "<a href='/?reversed=true'>Reverse the list?</a>"
    end
  end

  private
  
  def self.format_time_date(date_time) 
    d = DateTime.parse(date_time)
    return d.strftime("%A, %d %B %Y, %l:%M %p")
  end

  def self.db_connection()
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
  end
end